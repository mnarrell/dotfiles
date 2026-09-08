# Agent coordinator evaluation

Benchmark: **herdr 0.8.2** (incumbent). Goal: decide whether a tmux-native setup
covers worktree-per-agent, parallel fan-out, and attention routing.

Date: 2026-09-05. All star counts / push dates verified via GitHub API, not search.

## Method

Fully sandboxed so no tool could touch live config:

- `HOME` redirected to a scratch dir per tool (`bakeoff/home-workmux`, `home-deck`)
- Isolated tmux servers (`tmux -L wmxbake`, `-L deckbake`); the live `default`
  server and the `dots` session were never touched
- Throwaway git repo, single commit, `fakeagent` stub (`exec sleep 600`) as the
  agent command so no API calls were made
- All invocations with `< /dev/null` — see "first-run prompts" below

## Results

| | workmux 0.1.255 | agent-deck 1.15.0 | claude-squad | tmux-agent-sidebar 0.13.0 |
|---|---|---|---|---|
| Language / license | Rust / MIT | Go / MIT | Go / AGPL-3.0 | Rust / MIT |
| Stars / last push | 2,375 / 2026-09-05 | 845 / 2026-09-05 | 8,429 / 2026-08-20 | 515 / 2026-09-05 |
| Install | `brew install raine/workmux/workmux` | `brew install asheshgoplani/tap/agent-deck` | `brew install claude-squad` | TPM plugin |
| **Create worktree+session** | **0.28s** | **2.54s** | n/a (TUI only) | n/a |
| **Teardown** | **0.24s**, removes worktree + branch + session | `worktree finish` (merge+remove) | n/a (TUI only) | n/a |
| tmux server | **your current one** | **separate socket** (`agent-deck-tmux`) | your current one | your current one |
| Session naming | `" feat-a"` — *leading space* | `agentdeck_d-a_198dbb19` | — | — |
| Branch naming | as given | **auto-prefixed `feature/`** | — | — |
| Scriptable CLI | extensive | extensive | **none** | n/a |
| Status without harness hooks | no ("No active agents") | **yes** — infers from pane output | — | no |

## Per-tool findings

### workmux — fastest, most complete, and it wants your config

Measured 0.28s to create a worktree + tmux session + windows, 0.24s to tear the
whole thing down including the branch. Subcommand surface covers the entire
Phase 2 spike and more: `add/remove/merge/rebase/open/close/rename/resurrect`,
`dashboard/sidebar/list/status`, `send/capture/wait/run/reap-agents`.
`resurrect` restores worktree windows after a tmux or machine crash — a case the
original plan didn't consider.

Documented support for **both** Claude Code and OpenCode status tracking (its
docs table lists both as ✅), which is the requirement herdr currently satisfies.

Two real caveats:

1. **First-run prompts hijack the terminal.** A nerdfont probe, then
   `Install or update status tracking hooks? [Y/n]` defaulting to *yes*. During
   this evaluation that wizard wrote into `~/.claude/settings.json` — which is a
   symlink into this repo — plus `~/.config/opencode/plugins/`, `~/.gemini/`,
   `~/.copilot/`, and `~/.pi/`. It **merged** rather than clobbered (the herdr
   `SessionStart` hook and `snip-hook.py` survived), but it also reordered the
   whole JSON alphabetically, turning 5 added hooks into a 90-line diff. All of
   it was reverted; backups in the session scratchpad. Run `workmux setup` only
   deliberately, and commit the settings reformat as its own change.
2. **Session naming bug.** In `mode: session` the created session was literally
   `" feat-a"` with a leading space; documented default `window_prefix` is
   `"wm-"`. A leading-space session name is hostile to fuzzy switchers.

Non-interactive use requires `< /dev/null`; with stdin on a TTY and stdout
redirected it hangs silently.

### agent-deck — richest features, but it lives beside tmux, not in it

9x slower to create (2.54s vs 0.28s) and it defaults to **its own tmux server**,
so its sessions never show up in your `tmux ls` or any switcher you bind. That is
the same objection you have to herdr — a parallel universe of session state —
so adopting it would not solve the problem that opened this branch. Overridable
per-session with `--tmux-socket`, but that is swimming upstream.

It is opinionated about naming: `-w d-a --new-branch` produced branch
`feature/d-a` in directory `feature-d-a`, unasked.

One genuinely distinctive capability: `agent-deck status` reported
`0 waiting • 0 running • 3 idle` for sessions running a dumb `sleep` stub, with
**no harness hooks installed at all** — it infers state from tmux pane output.
Every other tool here requires hooks injected into Claude Code and opencode. That
makes it the only option that degrades gracefully when a harness changes its
event API.

### claude-squad — most popular, least automatable

`--help` exposes only `completion`, `debug`, `help`, `reset`, `version` plus
`-p/--program` and `-y/--autoyes`. **There is no scriptable surface** — no
`add`, no `list`, no `status`. It cannot be driven from a script, wired into a
`Taskfile`, or measured in an automated bake-off, and it cannot participate in
dotfiles-managed configuration. Combined with AGPL-3.0 and the slowest commit
cadence of the four, it is ruled out despite being the most starred.

### tmux-agent-sidebar — not a coordinator; the best status feed

Deliberately narrow: a sidebar over panes you already have. Its value is the
integration layer, which is more thorough than the one Phase 2b proposed writing:
**14 Claude Code hook events** including `PermissionDenied`, `TeammateIdle`,
`SubagentStart/Stop`, `TaskCreated/Completed`, plus an opencode plugin bridge
whose event map matches herdr's closely (`permission.asked`/`question.asked` →
blocked, `session.idle` → idle). State model: `running / waiting / idle / error /
done`.

Its opencode plugin is explicitly designed to be symlinked as a single file so it
**coexists** with existing plugins — i.e. it can run alongside herdr's during a
migration. Its `hook.sh` resolves the binary fresh on every fire and exits 0 when
missing, so a half-installed state never breaks an agent session.

## What was NOT tested

**End-to-end attention routing** — the single most important criterion. Verifying
that `working` / `blocked` / `done` actually reach the tmux status bar requires
real Claude Code and opencode sessions with hooks installed in your *real* `HOME`
(sandboxed `HOME` breaks harness auth). That cannot be sandboxed and cannot be
faked with a stub agent. It needs a live trial.

## Recommendation

**workmux for lifecycle, and settle status routing with a live trial.**

- workmux is an order of magnitude faster than agent-deck, drives your real tmux
  server, and its command surface subsumes the entire DIY spike. Set
  `worktree_dir` and `window_prefix` explicitly to fix the leading-space naming
  and to align worktree paths with the `git-tree` skill.
- Do **not** hand-write the status feed (original Phase 2b). Both workmux and
  tmux-agent-sidebar maintain that glue against two moving harness APIs; herdr is
  already on integration version 10 of its opencode plugin. Rent it.
- agent-deck's hookless status inference is the one idea worth stealing if hook
  maintenance becomes painful — but its separate tmux server disqualifies it as
  the primary coordinator.
- claude-squad: ruled out (no scriptable CLI, AGPL).

Open question for the live trial: whether workmux's own status tracking is
sufficient, or whether tmux-agent-sidebar's deeper event coverage is worth
running instead. Both write to tmux; running both at once would conflict.
