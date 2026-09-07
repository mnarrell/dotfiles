---
name: go
description: Use for Go design, API, concurrency, performance, dependency, profiling, build, test, and debugging work.
---

## Workflow

For Go build or test requests, follow the Taskfile-first workflow:

1. Inspect for `Taskfile.yaml`, `Taskfile.yml`, or another supported Taskfile.
2. If present, inspect targets with `task --list`.
3. Run `task clean test` for the standard test pass.
4. Use Taskfile-defined targets for requested build or test variants.

If a relevant target is unavailable, report that limitation rather than silently
falling back to `go build` or `go test`; direct Go commands are appropriate only
when no applicable Taskfile exists.

## Engineering guidance

Prefer idiomatic, maintainable Go APIs and package boundaries. Consider error
handling, interfaces, concurrency safety, performance tradeoffs, dependency
hygiene, focused tests, benchmarks, and profiling when relevant. Keep changes
scoped and use the repository's formatters, linters, and validation targets.

For output compression and read-only inspection, follow the `snip` skill and
global harness policy.
