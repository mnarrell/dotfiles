# Agent workflow guide

Working with coding agents (Claude Code, opencode, pi) in tmux: one session
per project, worktrees as windows, every agent's status visible from any
session, and a macOS notification when an agent needs you or finishes.

Why it is built this way, and how to revert: [agent-workflow-migration.md](agent-workflow-migration.md).

## Keys

Your tmux prefix (Ctrl-Space) bindings and Alacritty's Cmd shortcuts are
unchanged. Everything that works *across* sessions is on **left Option**:

| Key | What it does |
|---|---|
| ⌥w | **Sessions.** sesh picker: running sessions first, then directories zoxide knows. Type to filter, Enter switches (or creates the session), Esc closes. |
| ⌥s | **Agent sidebar** on the left of every window, listing agents in all sessions. Press again to hide. |
| ⌥d | **Agent dashboard** popup with a live preview of each agent. Enter goes to the agent, `q` closes. |
| ⌥a | **Jump** to the agent that most recently finished or is waiting for you. |
| ⌥o | **Back** to the session you were in before. |

Inside the sidebar: `j`/`k` move, Enter jumps to the agent, `?` lists the
rest. Inside the dashboard: `?` for help.

## Day to day

**Projects are sessions.** Press ⌥w and pick a project; sesh creates a
session there (named after the directory) or switches to it if it exists.
Inside it, make windows and panes as you like — nothing is laid out for you.

**Worktrees are windows.** worktrunk (`wt`) owns worktrees; tmux only
mirrors them. Run these from inside the project's session:

| You run | In tmux |
|---|---|
| `wt switch --create feat/dns` | new window `feat-dns` in this session, in the worktree |
| `wt switch feat/dns` | focuses that window (opens it if it was closed) |
| `wt switch main` | goes to the session's first window |
| `wt remove` | closes the window, once the worktree is really gone (a refused removal leaves it) |
| `wt merge` | leaves the window open; close it yourself (prefix `&`) |

**Agents are just programs in panes.** Start `claude`, `opencode` or `pi`
anywhere in tmux. Their status shows up three ways:

- **Window names** carry an icon: 🤖 working, 💬 needs you, ✅ done. tmux only
  draws these for the session you are in.
- **The sidebar and dashboard** (⌥s, ⌥d) list agents from *every* session.
- **Notifications**, below.

## Notifications

When an agent **needs you** (a permission prompt or a question) or
**finishes**, and you are not already looking at it, a macOS notification
appears:

- **Title:** which agent and what happened: "claude needs you", "opencode finished".
- **Subtitle:** where it is: `session › window`.
- **Body:** the project and what the agent is working on.
- **Icon:** the agent's own (Claude, OpenCode, a π for pi).
- **Sound:** the default alert for "needs you", Glass for "finished".

**Click it** to switch tmux to that agent's pane and bring Alacritty forward.
If the agent carries on before you get to it, the notification is withdrawn.

What to expect:

- Up to two seconds between the agent's change and the notification.
- Nothing for a pane that is already in front of you.
- If notifications vanish after a few seconds, the notifier is set to
  *Banners*; set it to *Alerts* (see setup step 7).
- With several Alacritty windows open, macOS chooses which one comes forward;
  tmux itself always switches to the right pane.
- Only agents with workmux hooks are tracked: Claude Code, opencode and pi.
  pi never reports "needs you", only working and done.

## How it works

```
claude / opencode / pi
  └─ workmux hooks (claude/settings.json, opencode/plugins/, pi extension)
       └─ workmux records each agent's state per tmux pane
            ├─ workmux sidebar, dashboard, window-name icons
            └─ tmux/bin/agent-notify  (polls `workmux status --json` every 2s)
                 └─ terminal-notifier → macOS notification → click: tmux switch-client
```

| Piece | Role | Lives in |
|---|---|---|
| sesh | sessions and the ⌥w picker | `sesh/sesh.toml` |
| worktrunk | worktrees; its hooks open and close the windows | `worktrunk/config.toml` |
| workmux | agent state, sidebar, dashboard (its worktree commands are not used) | `workmux/config.yaml` |
| agent-notify | the notifications; started with the tmux server | `tmux/bin/agent-notify`, `tmux/agent.conf` |
| agent-notifier-build | one terminal-notifier copy per agent, for the icons | `tmux/bin/agent-notifier-build` |

The ⌥ keys are bound in `tmux/agent.conf`; Alacritty sends left Option as
plain Meta (`option_as_alt = "OnlyLeft"`) with no bindings of its own.

## Troubleshooting

| Symptom | Check |
|---|---|
| No notification at all | Inside tmux, `workmux status --all --json` should list the agent. If not, its hooks are missing (re-run `task claude:up` / `opencode:up` / `pi:up`, then restart the agent). |
| Agent listed, still nothing | `pgrep -fl agent-notify` should show one watcher. If not, reload tmux (prefix `r`). Then `terminal-notifier -diagnose`. |
| Notification disappears | Its entry in System Settings → Notifications is on *Banners*; use *Alerts*. |
| Plain icon instead of the agent's | `tmux/bin/agent-notifier-build --force`, then allow and set to *Alerts* again. |
| ⌥ keys type characters or do nothing | Use *left* Option. Alacritty's config must have no `mods = "Alt"` bindings. |
| A message covers a pane | Press `q` to dismiss tmux's view mode. |

Never run `workmux setup`: it is an interactive wizard that rewrites
`~/.claude/settings.json`. The hooks it would install are already in this
repo.

## Setting up a new Mac

1. **Clone and bootstrap.** Installs Homebrew if missing.

   ```bash
   git clone git@github.com:mnarrell/dotfiles.git ~/.dotfiles
   ```

   ```bash
   cd ~/.dotfiles && source bootstrap
   ```

2. **Install packages** from the Brewfile for this machine (`Brewfile`,
   `Brewfile.home` or `Brewfile.mini`). This brings tmux, sesh, workmux (from
   the `raine/workmux` tap), worktrunk, terminal-notifier, zoxide, fzf, eza
   and jq.

   ```bash
   brew bundle --file=Brewfile
   ```

3. **Install the agents' desktop apps first** if you want their icons on
   notifications: Claude.app (cask `claude`) and OpenCode.app (cask
   `opencode-desktop`). Without them the notifications still work, with
   terminal-notifier's icon.

4. **Deploy the dotfiles.** Links tmux, sesh, workmux, worktrunk, Alacritty
   and Claude Code config, and builds the per-agent notifiers.

   ```bash
   task
   ```

   macOS asks once per notifier ("Claude (tmux)", "OpenCode (tmux)",
   "pi (tmux)") whether it may send notifications: allow each.

5. **opencode and pi** are not in the default run; link their config (which
   includes the workmux plugin and extension) separately:

   ```bash
   task opencode:up pi:up
   ```

6. **tmux plugins.** tpm is not installed by any task:

   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
   ```

   Then start tmux and press prefix `I` to install the plugins.

7. **Notification style.** In System Settings → Notifications, set
   *terminal-notifier*, *Claude (tmux)*, *OpenCode (tmux)* and *pi (tmux)* to
   **Alerts**, so they stay until clicked. (terminal-notifier itself asks for
   permission the first time it is used.)

8. **Check it.** In tmux, open two sessions with ⌥w. In one, start `claude`
   and give it something that takes a few seconds, e.g.
   `run "sleep 15 && echo done" in bash`; switch to the other with ⌥o. A
   "claude finished" notification (or "needs you", if it asks permission)
   should appear; clicking it brings you back.
