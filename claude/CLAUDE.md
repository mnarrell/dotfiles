@~/.agents/AGENTS.md

## Claude Code

- The `design` skill is also available here.
- Do routine work directly instead of delegating by default. Fork yourself for bounded
  work whose tool output would otherwise bloat context (e.g. "grep the repo for every
  caller of X and summarize" or "read these five files and report their schema") — a
  fork inherits full conversation context, so it needs no re-briefing. Delegate to
  `researcher` only for bounded external/web lookups, with a narrow question and the
  desired evidence, not the whole conversation. Reserve a fresh `worker` agent for work
  that must run isolated from this context, such as a parallel independent edit or a
  worktree-isolated change. See `claude/agents/README.md` for worked examples.
- For materially ambiguous or cross-cutting work (architecture, migrations, security
  boundaries, irreversible choices), load the `design` skill before touching code.
- OpenCode and Claude transparently run the approved shell catalog through `snip`. Issue normal commands; use the `snip` skill only for raw output, debugging, or an unavailable integration.
