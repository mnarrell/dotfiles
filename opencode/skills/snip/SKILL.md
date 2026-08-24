---
name: snip
description: "Use when output compression needs debugging, bypassing, or verification in the configured snip integrations."
---

## Configured Integrations

OpenCode uses a pinned `opencode-snip` plugin. Claude Code uses
`~/.claude/snip-hook.py`, which permits transparent rewrites only for the explicit
safe and routine command catalog. Issue ordinary commands; do not manually prefix
them with `snip`.

Commands outside Claude's catalog keep their normal permission flow and may run
unfiltered. This protects Git, GitHub, and shell mutations from the hook's automatic
approval behavior.

## Exceptions

- Use `snip proxy -- <command>` when raw output is required.
- On remote machines without `snip`, run the command normally.
- A command without a matching filter passes through unchanged.

## Diagnostics

```bash
snip check -- <command>
snip -v <command>
snip hook-audit
```
