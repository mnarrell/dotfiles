---
name: snip
description: "Use when output compression needs debugging, bypassing, or verification in the configured snip integrations."
---

## OpenCode integration

Issue ordinary raw shell commands. The repo-local OpenCode rewrite hook adds
`snip ` only to eligible nonempty simple Bash commands, before OpenCode's native
permission and external-directory checks. It leaves a whole command raw when it
contains a compound operator or any ambiguous shell syntax.

A manual `snip` prefix is not inherently trusted: it must still match the
applicable command-specific permission rule. Restart OpenCode after changing the
plugin or its configuration.

## Exceptions

- Use `snip proxy -- <command>` when raw output is required.
- On remote machines without the local rewrite hook, run the command normally.
- A command without a matching filter passes through unchanged.

## Diagnostics

```bash
snip check -- <command>
snip -v <command>
snip hook-audit
```
