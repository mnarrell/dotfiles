---
name: design
description: Interview the user and produce an approved, decision-complete design before touching code, for ambiguous, high-impact, or cross-cutting work.
---

Use this skill instead of guessing when requirements are materially ambiguous,
or the work involves cross-cutting architecture, migrations, security
boundaries, irreversible choices, or competing consequential approaches. Do
not implement until the design is approved.

This skill rides on Claude Code's native Plan Mode rather than a bespoke
approval flow: Plan Mode already enforces read-only investigation, blocks
edits until the user explicitly approves, and hands control straight back to
you for implementation — no separate hand-off to another agent is needed.

## Invocation

Three ways this skill starts, all equivalent once running:

1. **Automatically.** When a request's shape matches this file's
   `description` — ambiguous requirements, cross-cutting architecture,
   migrations, security boundaries, irreversible choices, or competing
   consequential approaches — load it yourself before writing any code or
   proposing a plan. Don't wait for the user to name it.
2. **User slash command.** The user types `/design` (optionally with a short
   description of the work) in their prompt. Treat that exactly like case 1:
   load this skill and start at step 1 below.
3. **Explicit tool call.** Call the `Skill` tool with `skill: "design"`,
   passing the work's short description as `args` if you already have one:

   ```
   Skill({ skill: "design", args: "redesign the auth token refresh flow" })
   ```

   Use this when you're mid-conversation and recognize the shift into
   design-shaped work yourself, without the user typing the slash command.

## How to run it

1. **Investigate first.** Inspect relevant code, docs, config, tests, and
   read-only Git metadata before asking anything. Never ask what you can find
   yourself.
2. **Enter Plan Mode** (`EnterPlanMode`, or continue if the user already
   started the turn in plan mode).
3. **Interview in adaptive rounds** of 3-6 focused questions via
   `AskUserQuestion` — only for answers that materially change objectives,
   scope, architecture, compatibility, risk, or acceptance criteria.
   Recommend one option, label it "(Recommended)", explain the consequence
   briefly, and allow a custom answer. Checkpoint settled decisions after each
   round; don't re-ask them unless new evidence invalidates the premise.
   Challenge a risky preference with evidence, but honor an explicit informed
   decision.
4. **Delegate evidence gathering, not decisions.** For one bounded external
   question that would resolve a pending decision, dispatch it to `researcher`
   (or `fork` if it needs this conversation's context) rather than browsing
   directly. Never delegate the design decision itself.
5. **Compare 2-3 viable approaches**, recommend one, and record the rejected
   alternatives and why. Prefer reversible decisions; address rollback,
   migration, security, operability, compatibility, performance, and recovery
   when relevant. Use a compact Mermaid diagram only when it materially
   clarifies the design.
6. **Exit Plan Mode** (`ExitPlanMode`) with the finished plan. The user's
   approval at that gate *is* the design approval — there is no separate
   "approved" reply to collect.
7. **Implement directly** once approved, in the same conversation. If you want
   a durable artifact instead of (or in addition to) inline implementation —
   e.g. to hand this off to a different session or a GitHub Issue — load the
   `handoff` skill and use its `Plan Handoff v1` format; that always needs its
   own separate, explicit approval before anything is written.

## Rules

- Never edit code, configuration, tests, or unrelated documentation before the
  plan is approved.
- Do not change an approved plan silently. If implementation exposes a stale
  assumption or a substantive design change, stop, explain what changed, and
  re-run the interview for the affected part only.

## Usage examples

**Cross-cutting change, implement in this session (the common case):**

> User: "Let's redesign how auth tokens get refreshed — the current approach
> races under load."
>
> 1. Read the current auth/token code, tests, and any related issues.
> 2. Enter Plan Mode.
> 3. Ask: storage of the new lock/lease (Recommended: DB row lease vs. in-memory
>    mutex vs. distributed lock), and rollout strategy (Recommended: behind a
>    flag vs. big-bang).
> 4. Compare the 3 storage options, recommend the DB row lease, note why the
>    others were rejected.
> 5. Exit Plan Mode with the plan; on approval, implement it directly — no
>    hand-off needed.

**Design meant for someone else to implement later:**

> User: "Sketch out the migration plan for splitting this service, but don't
> build it — I want to hand it to another session next week."
>
> Same investigation and interview, but after Plan Mode approval, load
> `handoff`, produce a `Plan Handoff v1` covering scope, decisions, ordered
> steps, and verification, preview the exact destination (path or GitHub
> Issue), and get separate approval before writing it anywhere.
