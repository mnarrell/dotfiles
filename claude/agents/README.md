# Agent delegation

Do routine work directly, in the calling conversation: read, edit, run Bash,
verify. That covers almost everything — single- or few-file changes,
debugging, routine verification. No agent needed.

Reach for delegation only when one of the three cases below applies, and pick
the cheapest one that fits.

## `fork` — same context, output you don't need to keep

Call the `Agent` tool with `subagent_type: "fork"`. A fork inherits this
entire conversation verbatim — every file already read, every decision
already made — so the prompt is an instruction ("go do X"), never a briefing.
Use it when the *decision-making* still belongs in this conversation but the
*tool output* would otherwise bloat context with things you won't need again.

```
Agent({
  subagent_type: "fork",
  description: "Find ParseConfig callers",
  prompt: "Grep this repo for every caller of ParseConfig and summarize the
           call sites — file, line, and how the result is used. I don't need
           the raw grep output, just the summary."
})
```

Forking returns immediately; the result arrives later as a notification, not
something to poll for. Do not fabricate or guess at a fork's findings before
that notification lands.

Do not fork for work that must run somewhere isolated from this context — a
parallel edit racing against other work, or a change that needs its own
worktree. Use `worker` for that instead.

## `researcher` — bounded external lookups only

Call the `Agent` tool with `subagent_type: "researcher"`. This starts a fresh
agent with none of this conversation's context, restricted to read-only
research (`WebFetch`, `WebSearch`, plus read-only local/Git inspection) — no
`Edit`, `Write`, or further delegation. Give it the exact question and the
evidence you want back, not the surrounding conversation.

```
Agent({
  subagent_type: "researcher",
  description: "PG17 ALTER TYPE lock behavior",
  prompt: "What's the current recommended way to do zero-downtime schema
           migrations in PostgreSQL 17? I need a yes/no on whether ALTER TYPE
           ADD VALUE still requires a lock, with a source."
})
```

## `worker` — isolated, fully-briefed implementation

Call the `Agent` tool with `subagent_type: "worker"`. Like `researcher`, this
is a fresh agent with zero memory of this conversation — write the brief as
if briefing a stranger: objective, exact scope (files/functions to touch and
what not to touch), steps, acceptance criteria, the exact verification
command, and constraints. Use it only when the work genuinely must run
isolated from this context.

```
Agent({
  subagent_type: "worker",
  description: "Bump Go version to 1.24",
  prompt: "In a fresh worktree, bump the pinned Go version in go.mod and the
           CI workflow to 1.24, run `task test`, and report the diff and test
           result. Scope: go.mod, go.sum, .github/workflows/ci.yml only."
})
```

If the brief can't be made that complete, the work isn't ready to delegate —
resolve the ambiguity yourself first, or just do it directly.

## Ambiguous or cross-cutting work: use the `design` skill first

None of the above is for deciding *what to build*. For materially ambiguous
or cross-cutting work — architecture, migrations, security boundaries,
irreversible choices — invoke the `design` skill before any of this. See
`opencode/skills/design/SKILL.md` for exactly how it's invoked and what it
does; implementation afterward happens directly in this conversation, per the
first line of this file.
