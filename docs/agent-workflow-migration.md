# Migrating the agent workflow: workmux → herdr + worktrunk

Date: 2026-09-14. Supersedes the workmux setup recorded in
[agent-coordinator-eval.md](agent-coordinator-eval.md).

## Why

workmux showed agent status by appending to tmux's `window-status-format`.
tmux only renders the window list for the session you are attached to, so an
agent finishing in **another session was invisible** — and workmux has no
system notification for agent state at all. That is a tmux constraint, not a
workmux defect, so no tmux plugin could fix it.

herdr is a terminal workspace manager rather than a tmux plugin. All workspaces
live under one server with one UI, so it can notify across all of them, and it
suppresses popups for the active tab — alerting on exactly the agents you are
*not* watching. It also carries integrations for all three harnesses in use
(Claude Code, opencode, pi), which nothing in the tmux plugin ecosystem does.

herdr does not do git worktree lifecycle well, so worktrunk (`wt`) owns that.

## Shape

**worktrunk drives herdr.** `wt` is what you type; hooks keep herdr in sync.

```
wt switch --create fix/dns
  └─ creates ~/.worktrees/<repo>/fix-dns
  └─ post-start hook → herdr worktree open --focus
       └─ herdr workspace, agent status, system toast on completion
```

- **Worktree root**: `~/.worktrees/{{ repo }}/{{ branch | sanitize }}` —
  one global root, split by project and branch. Already granted in
  `claude/settings.json`, so agents working inside a worktree need no extra
  permission. `sanitize` flattens `feat/dns` to `feat-dns` rather than nesting.
- **Dotted repos are pinned explicitly.** `{{ repo }}` is the checkout's
  directory name, so `.dotfiles` would land in a hidden `~/.worktrees/.dotfiles/`.
  No filter strips a leading dot and no variable exposes the remote-derived
  identifier (which is already dot-free), so `.dotfiles` and `.private_dotfiles`
  get `[projects."<id>"]` overrides at the end of `worktrunk/config.toml`. Find
  an identifier with `wt config show | grep Identifier`.
- **herdr's own `[worktrees] directory`** points at the same root, so a worktree
  made from herdr's UI lands beside those made with `wt`. The `new_worktree`
  keybinding is deliberately unbound — `wt` is the one path that runs the hooks.

## Command equivalence

| Old (workmux) | New |
|---|---|
| `workmux add <branch>` | `wt switch --create <branch>` |
| `workmux open <handle>` | `wt switch <branch>` |
| `workmux remove` | `wt remove` |
| `workmux merge` | `wt merge` |
| `workmux list` | `wt list` (or `wt list --full` for CI status) |
| `workmux dashboard` (`prefix+a`) | herdr sidebar — `Option+s` |
| `workmux list` picker (`prefix+A`) | herdr workspace navigation — `Option+w` |
| `workmux status` | `herdr workspace list` |
| status in tmux window bar | herdr sidebar + system toast |
| — | `wt switch pr:123`, LLM commit messages, CI status |

herdr's prefix is `ctrl+space`, matching the old tmux prefix, and Alacritty
rewrites both `Cmd` and `Option` chords onto it — so panes, tabs and splits keep
their existing muscle memory, and workspaces, agents and navigation get a
single-modifier `Option` layer. `Option+a` jumps straight to whichever agent
raised the last toast. The rewrite is load-bearing: herdr does not match `alt`
chords delivered from Alacritty at all. See [herdr-keymap.md](herdr-keymap.md).

## Hooks

Hook bodies are standalone scripts in `worktrunk/hooks/`, not inline commands,
so they can be run and debugged directly:

```bash
./worktrunk/hooks/herdr-open.sh <worktree_path> <repo_path> <branch>
./worktrunk/hooks/herdr-close.sh <worktree_path>
```

Wired in `worktrunk/config.toml`:

| Hook | Script | Why |
|---|---|---|
| `post-start` | `herdr-open.sh` | new worktree → open + focus its workspace |
| `post-switch` | `herdr-open.sh` | existing worktree → focus it (without this the integration only works on creation) |
| `pre-remove` | `herdr-close.sh` | close the workspace before the checkout is deleted, so herdr is not left holding a dead path |

Every other hook type is listed commented-out in the config; enabling one is
uncommenting a line.

### Two things that are easy to get wrong

**`herdr worktree open` needs `--cwd` as well as `--path`.** `--cwd` names the
parent repo so herdr can resolve which repository the checkout belongs to.
Passing `--path` alone returns `worktree_not_found`.

**`pre-*` hooks are blocking — a nonzero exit aborts the operation.** Both
scripts therefore exit 0 on every path: missing binary, stopped server, missing
`jq`, bad arguments. A convenience hook must never be able to wedge
`wt remove`. Keep this property when editing them.

`herdr workspace close` takes a `workspace_id`, not a path, so `herdr-close.sh`
resolves it by matching `.worktree.checkout_path` in `herdr workspace list`
JSON.

### Known gap

`post-merge` is **not** wired. `wt merge` tears down the worktree without
closing its herdr workspace, leaving one pointing at a deleted path. The config
stubs it; enable it if `wt merge` becomes the habitual teardown path rather
than `wt remove`.

## What changed in this repo

**Added** — `worktrunk/config.toml`, `worktrunk/hooks/`,
`zsh/init.d/60-worktrunk.zsh` (shell integration, `eval`'d at init like the
direnv hook so it tracks the installed version rather than going stale).

**Removed** — `workmux/`, both `workmux-status` adapters, the five
`workmux set-window-status` / `register-agent` hooks in `claude/settings.json`,
and the `prefix+a` / `prefix+A` bindings in `tmux/tmux.conf`.

**Renamed** — the `git-tree` skill is now `git-branch` and covers branch
hygiene only. Worktree placement is a human decision, not something the skill
directs.

**tmux stays installed.** Only the workmux bindings were removed. It remains
available for remote SSH work and as an immediate fallback.

## Revert

tmux is untouched, so the old workflow is one `tmux` invocation away even
before reverting anything.

```bash
git revert <commit>
task workmux:up          # restored by the revert
brew install raine/workmux/workmux
workmux setup            # re-installs the status hooks
```

Then set `herdr/config.toml` `[worktrees] directory` back if you want herdr's
own worktrees separated again. Existing worktrees survive either direction —
only the tooling around them changes.

To drop worktrunk: `task worktrunk:down && brew uninstall worktrunk`.
