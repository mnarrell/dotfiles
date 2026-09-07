---
name: opentofu
description: Use for OpenTofu modules, providers, state, validation, testing, and safe planning.
---

Inspect repository conventions before acting. Work idiomatically with OpenTofu
modules, providers, variables, outputs, state, backends, and workspace layout.
Use formatting, validation, tests, and safe plan workflows as appropriate;
distinguish local rendering and static checks from remote effects.

Explicit approval is required before `apply`, `destroy`, `import`, state
mutation, `force-unlock`, workspace changes, backend changes, or any operation
that can alter infrastructure or shared state. Never expose credentials or
secrets; report plan uncertainty and provider/backend assumptions.
