# Agent workflow: tmux + sesh + worktrunk + workmux

Date: 2026-10-24. Supersedes the herdr setup this document described before
(see its git history); herdr itself stays installed as a fallback.

This is the why and the wiring. For keys, daily use, troubleshooting and
setting up a new Mac, see the guide: [agent-workflow.md](agent-workflow.md).

## Why

herdr fixed the two things a plain tmux setup lacked: agents finishing in
another session were invisible, and nothing raised an OS notification. Both
are now covered natively in tmux, by off-the-shelf tools plus one small
script:

- **Cross-session visibility:** workmux's sidebar and dashboard list agents
  from every session, not just the attached one (the old workmux problem was
  its window-status icons, which tmux only draws for the attached session).
- **Notifications:** workmux has none, so `tmux/bin/agent-notify` watches
  `workmux status --json` and raises native macOS notifications.

## Shape

| Need | Tool | Config |
|---|---|---|
| One session per project | sesh | `sesh/sesh.toml` |
| Worktrees, one tmux window each | worktrunk | `worktrunk/config.toml` hooks |
| Agent status, sidebar, dashboard | workmux | `workmux/config.yaml`, harness hooks below |
| macOS notifications | `tmux/bin/agent-notify` | started by `tmux/agent.conf` |

workmux is used for status only. Its worktree commands (`add`, `open`,
`merge`, `remove`, `close`) are never used; worktrunk owns worktrees.

## Keys

The ⌥ keys (see the guide) are bound in `tmux/agent.conf`. Alacritty sends
left Option as plain Meta (`option_as_alt = "OnlyLeft"`) and must not also
rewrite those chords: the old herdr Option layer turned ⌥k into prefix+[
(copy-mode) and so on, and Alacritty runs every matching binding, so both
fired.

## Agent status hooks

The same hooks workmux's own integrations install, kept in this repo so
`workmux setup` never runs (it is interactive and rewrites
`~/.claude/settings.json`):

- **Claude Code:** five hooks in `claude/settings.json`, copied from
  workmux's Claude plugin (`.claude-plugin/plugin.json`).
- **opencode:** `opencode/plugins/workmux-status.ts`, loaded automatically.
- **pi:** `pi/agent/extensions/workmux-status.ts`, loaded automatically
  (`~/.pi` links to `pi/` in this repo).

The plugin files are copied unchanged from workmux v0.1.277
(`resources/opencode/plugins/`, `resources/pi/extensions/`). On a workmux
upgrade, re-copy them from the matching tag. All of them are silent no-ops
outside tmux.

## Notifications

`agent-notify` runs once per tmux server (a lock in `$TMPDIR`; it exits with
the server) and diffs `workmux status --all --json` every 2s. Each agent's
icon comes from its own copy of terminal-notifier, built by
`tmux/bin/agent-notifier-build` (run by `task tmux:up`): macOS takes a
notification's icon from the sending app, with no per-notification override.

### Things that are easy to get wrong

- **Terminal notifications (OSC 9/777) are not an option:** Alacritty does
  not support them, and a detached session has no terminal to send them to.
- **First notification permission:** terminal-notifier asks only when it is
  launched through LaunchServices; `agent-notifier-build` does that.
- **`run-shell` output lands on your pane:** anything a `run-shell` job
  prints, or a nonzero exit (e.g. the watcher being stopped), is shown in view
  mode over the current pane. The watcher is started silent.
- **Alacritty can't override an imported binding:** every matching binding
  runs, so the herdr Option layer had to be removed, not shadowed.
- **workmux's first run asks about Nerd Font icons** and blocks the dashboard
  until answered; `workmux/config.yaml` sets `nerdfont: true`.

## worktrunk hooks

| Hook | Effect |
|---|---|
| `post-start`, `post-switch` | focus the branch's window in the project session, or open a plain one; the primary checkout is window 1 |
| `post-remove` | close the branch's window, only after the checkout is gone |

`wt merge` does not close the window; a commented `post-merge` line enables
that.

## herdr fallback

herdr, its config (`herdr/`), its task and its harness integrations are still
in place; only its worktrunk hooks and Alacritty Option layer were removed.
To use it again:

1. Restore the Option layer: `git show <this commit>^:alacritty/alacritty.toml`
   has the nine `\u0000<key>` bindings at the end.
2. Re-add the herdr steps to `worktrunk/config.toml` (`herdr-open.sh` in
   `post-switch` and the last `[[post-start]]`; the scripts are still in
   `worktrunk/hooks/`).
3. Run `herdr`.

## Revert

```bash
git revert <commit>
task alacritty:up worktrunk:up tmux:up claude:up
task sesh:down workmux:down
```

To drop the tools: `brew uninstall sesh workmux terminal-notifier` and remove
`~/.local/share/tmux-agents/` (the icon copies).
