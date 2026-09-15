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

---

# Follow-up: the live trial, 2026-09-14

The trial the original evaluation deferred has now run, on real work rather than
a stub agent. It answered the open question above, and in doing so invalidated
the recommendation. Star counts and push dates below re-verified via the GitHub
API on 2026-09-14, same method as the original.

## What the trial found

**Attention routing does not work across tmux sessions, and no tmux-native tool
can make it.**

workmux's status indicator works by appending to `window-status-format`:

```tmux
set -g window-status-format '#I:#W#{?@workmux_status, #{@workmux_status},}...'
```

tmux only renders the window list for the session you are attached to, and the
workmux docs confirm the modification "happens once per session and only affects
the current tmux session". So an agent finishing in a window belonging to
another session is invisible. This is a tmux constraint, not a workmux defect —
`window-status-format` is session-scoped by design, so every tool in the
status-plugin category inherits the same ceiling.

workmux has no system notification for agent state at all. The only
`--notification` flag in its entire surface is on `workmux merge`.

What does cross the boundary, and what it costs:

| Mechanism | Scope | Shape |
|---|---|---|
| `window-status-format` indicator | current session only | push |
| `workmux dashboard` (bound to `prefix+a`) | all sessions (`F` filters) | **pull** — only when the popup is open |
| `workmux sidebar` | all sessions by default | push, but a permanently occupied pane |

The sidebar is the only built-in push mechanism that spans sessions, and it buys
that by giving up a pane in every window. Session mode (`mode: session`) does not
help: it changes which tmux object a worktree maps to, not the scope of the
status bar.

## The second constraint: three harnesses

This setup runs **Claude Code, opencode, and pi**. That requirement eliminates
most of the category outright — far more decisively than any feature comparison.

Ruled out for missing pi support:

| Tool | Stars | Last push | Harnesses |
|---|---|---|---|
| [hiroppy/tmux-agent-sidebar] | 528 | 2026-09-10 | Claude, opencode |
| [samleeney/tmux-agent-status] | 276 | 2026-09-10 | Claude, Codex (no license file) |
| [gavraz/recon] | 263 | 2026-07-17 | Claude Code only |
| [accessd/tmux-agent-indicator] | 92 | 2026-08-14 | Claude, Codex, opencode |
| [CRThaze/tmux-handlr] | 0 | 2026-09-14 | excludes `pi` by default — 2-char name is false-positive-prone |

Note that tmux-agent-sidebar, the original evaluation's runner-up, is ruled out
here. Its deeper event coverage is real but it never gained a pi adapter.

Surviving tools with native Claude + opencode + pi:

| Tool | Stars | Last push | Verdict |
|---|---|---|---|
| workmux | 2,582 | 2026-09-14 | incumbent; cannot notify across sessions |
| [YoanWai/agent-manager] | 459 | 2026-09-14 | **private tmux server `agentmgr`** — the agent-deck disqualifier |
| [Ataraxy-Labs/opensessions] | 1,227 | 2026-06-23 | has `integrations/pi-extension/`; **no license file**; stale |
| [Gentleman-Programming/gentle-agent-state] | 54 | 2026-07-01 | installs to the exact three adapter paths already in use; status only; stale |
| [alexei-led/ccgram] | 265 | 2026-09-14 | Telegram bridge; pi yes, **opencode no** |

`gentle-agent-state` was the one genuine find — it writes to
`~/.pi/agent/extensions/`, `~/.config/opencode/plugins/`, and merges hooks into
`~/.claude/settings.json`, the identical three-point shape already in use, with
per-agent opt-in flags. Paired with a lifecycle-only tool it would reconstitute
the whole setup. It was rejected on maintenance risk: 54 stars and untouched
since 2026-07-01 is a worse bet than what it would replace, and the original
evaluation's own conclusion was "do not hand-write the status feed, rent it".

## worktrunk: different category, not an upgrade

[max-sixty/worktrunk] (7,654 stars, pushed 2026-09-14, Rust, MIT OR Apache-2.0)
prompted this review by looking more featured. It is a git worktree *lifecycle*
CLI — `switch/list/merge/remove`, branch-name-as-identity with generated paths,
create/pre-merge/post-merge hooks, LLM commit messages, `wt switch pr:123`, CI
status and AI summaries in `wt list --full`, APFS-cloned build caches,
`hash_port` for per-worktree dev servers.

It has **no multiplexer management and no agent status tracking**. Its demos use
Zellij; tmux "integration" is `tmux new-session -d -s foo "wt switch --create foo
-x claude"` — you drive tmux yourself. Adopting it would mean losing the entire
attention-routing layer to gain git-side polish. Its features are real and
workmux lacks them, but they are not the problem this evaluation exists to solve.

## herdr, reconsidered

[herdrdev/herdr] — 38,516 stars, Apache-2.0, Rust, pushed 2026-09-14. Local
install is 0.9.0, up from the 0.8.2 benchmarked originally, still present in all
three Brewfiles with a fully configured `~/.config/herdr/config.toml`.

It does the thing tmux cannot. From the v0.9.0 configuration docs:

> Herdr can notify you when a background agent finishes or needs input

```toml
[ui.toast]
delivery = "herdr"        # or "terminal" (works over SSH), "system" (OS), "off"
delay_seconds = 1
```

On macOS, `system` delivery uses `terminal-notifier` and the notification can
activate the hosting terminal on click. Separate sounds for finished vs
needs-input (`done_path` / `request_path`), with per-agent overrides. Crucially,
**Herdr suppresses popups for the active tab** — it notifies about exactly the
agents you are not looking at. That is the cross-session problem solved by
design rather than worked around.

Harness coverage is 17 integrations, well beyond anything else surveyed.
`herdr integration status` locally:

```
pi:       current (v8)
claude:   outdated (v8 < v9)
opencode: outdated (v10 < v11)
```

Two `herdr integration install` calls restore it.

**The cost has not changed.** herdr is a terminal workspace manager — a tmux
replacement, not a plugin. The "parallel universe of session state" objection
that opened this branch still applies in full:

- `tmux/tmux.conf` dashboard (`prefix+a`) and picker (`prefix+A`) become dead config
- the `dots` session, tpm plugins, and anything assuming one tmux server
- `workmux resurrect`, and tmux's two decades of hardening

Harness-glue churn also continues: opencode's plugin moved v10 → v11 and
Claude's v8 → v9 in the ten days since the original evaluation. The difference
is that herdr versions and installs that glue itself.

## Revised recommendation

**herdr, if cross-session agent notification is a firm requirement.**

The original evaluation was not wrong on its own terms — it explicitly listed
end-to-end attention routing as untested and requiring a live trial. The trial
has now run and failed on that criterion. The premise was the error, not the
analysis: tmux-native was never able to deliver cross-session attention routing,
because tmux itself cannot.

So the choice is between two coherent positions, and it is a genuine trade:

- **Stay on workmux** and accept that notification is session-scoped —
  acceptable if worktrees for the projects being watched live in one session, or
  if the always-on sidebar is tolerable. Keeps the whole tmux ecosystem.
- **Return to herdr** and accept that it owns the terminal. Gets real system
  notifications, 17 harnesses, remote/SSH sessions, and a maintained integration
  layer. Costs the tmux-native bindings and ecosystem.

Not recommended either way: worktrunk as a workmux replacement (wrong category),
agent-manager and agent-deck (private tmux servers), gentle-agent-state
(maintenance risk), claude-squad (still no scriptable CLI, still AGPL, last push
2026-08-20).

If herdr is adopted, the leftover workmux adapters
(`opencode/plugins/workmux-status.ts`, `pi/agent/extensions/workmux-status.ts`),
the five `workmux set-window-status` hooks in `claude/settings.json`, and the
tmux bindings at `tmux/tmux.conf:152-155` all become dead and should be removed
in the same change. The herdr adapters for opencode and pi are still in the tree
and still current-ish, so the two setups have been running side by side.

## Decision, 2026-09-14

**herdr for the workspace surface, worktrunk for git worktree lifecycle.**
Cross-session notification was a firm requirement, so the second option above
was taken and workmux was fully retired in the same change.

worktrunk was not adopted *instead of* workmux — it is a different category, and
the earlier "not an upgrade" finding stands. It is adopted alongside herdr
because herdr does not do git worktree lifecycle well, with worktrunk hooks
opening and closing herdr workspaces so the two stay in sync.

Implementation, command equivalence, and the revert procedure:
[agent-workflow-migration.md](agent-workflow-migration.md).

[hiroppy/tmux-agent-sidebar]: https://github.com/hiroppy/tmux-agent-sidebar
[samleeney/tmux-agent-status]: https://github.com/samleeney/tmux-agent-status
[gavraz/recon]: https://github.com/gavraz/recon
[accessd/tmux-agent-indicator]: https://github.com/accessd/tmux-agent-indicator
[CRThaze/tmux-handlr]: https://github.com/CRThaze/tmux-handlr
[YoanWai/agent-manager]: https://github.com/YoanWai/agent-manager
[Ataraxy-Labs/opensessions]: https://github.com/Ataraxy-Labs/opensessions
[Gentleman-Programming/gentle-agent-state]: https://github.com/Gentleman-Programming/gentle-agent-state
[alexei-led/ccgram]: https://github.com/alexei-led/ccgram
[max-sixty/worktrunk]: https://github.com/max-sixty/worktrunk
[herdrdev/herdr]: https://github.com/herdrdev/herdr
