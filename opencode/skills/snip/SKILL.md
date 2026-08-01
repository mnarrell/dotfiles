---
name: snip
description: "Compress shell-command output with `snip` before it enters context. Covers when to prefix vs. skip it, debugging which filter matched, and checking token savings."
---

## Rule

Prefix shell commands with `snip` to compress their output before it enters the context
window. `snip` has 126 built-in filters (git, go, cargo, npm, docker, and more); commands
without a matching filter pass through unchanged.

```bash
snip git log -10
snip go test ./...
snip cargo test
snip npm run build
snip docker ps
```

## When to skip

- `snip` reports `snip: no filter for "<cmd>"` — rerun without `snip`.
- You need raw, unfiltered output.
- Remote machines (SSH, Docker) that don't have `snip` installed.

## Debug which filter matched

```bash
snip -v git log
```

## Token savings

```bash
snip gain            # total saved
snip gain --daily
snip gain --top 10
```

| Command         | Raw output                                  | Filtered output                      |
| --------------- | ------------------------------------------- | ------------------------------------ |
| `go test ./...` | 689 tokens, full package list with coverage | `10 passed, 0 failed` (16 tokens)    |
| `git log`       | 371 tokens, full commit metadata            | 53 tokens (hash + message + author)  |
| `git status`    | 112 tokens, verbose file listings           | 16 tokens (staged/unstaged summary)  |
| `cargo test`    | 591 tokens, test names and durations        | 5 tokens (pass/fail summary)         |
