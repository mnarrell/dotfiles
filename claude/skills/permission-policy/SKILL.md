---
name: permission-policy
description: "Inspect and propose updates to the layered OpenCode and Claude Code permission policies. Use when permission rules drift, a permission prompt is unexpected, or access needs to change."
---

# Permission Policy

Maintain the permission boundary between the conservative global policy and the
broader policy used by this dotfiles repository. This is a review-first skill:
inspect first, propose changes second, and edit only after the user approves the
proposal.

## Policy Files

Inspect all four files before making a recommendation:

| Scope               | OpenCode                  | Claude Code             |
| ------------------- | ------------------------- | ----------------------- |
| Global              | `opencode/opencode.jsonc` | `claude/settings.json`  |
| Dotfiles repository | `opencode.jsonc`          | `.claude/settings.json` |

The global files are deployed by `task opencode:up`. The dotfiles-local files
are loaded only when the corresponding repository is active; do not symlink or
copy the local files into global configuration.

## Invariants

Treat these as the intended security boundary unless the user explicitly asks
to change it:

- Global access is conservative and must not grant broad home-directory access.
- Dotfiles-local access may cover the managed XDG directories and dotfiles
  tooling used by this repository.
- `/tmp` is explicitly available where the current policy permits it.
- `~/.ssh/config` may be read but must not be edited.
- `~/.config/op/**` is denied.
- `~/.config/comcast/**` requires approval.
- Unlisted external directories require approval.
- Read-only inspection commands may be allowed explicitly; mutating Git,
  worktree, GitHub, or infrastructure commands require approval.
- `gh api` requires approval because flags can perform mutations.
- OpenCode and Claude should have equivalent intent, not identical syntax.
  Claude's `additionalDirectories` and permission precedence have no direct
  OpenCode equivalent.

Do not broaden an `ask` or `deny` rule to `allow`, add a broad wildcard, or
allow a command that can mutate state without explicit user approval.

## Inspect

When invoked, determine the requested scope first: global, dotfiles-local, or
both. Then:

1. Read all four policy files and preserve unrelated settings.
2. Check for missing counterpart rules, broad wildcards, duplicate rules, and
   rules whose ordering changes their effective result.
3. For OpenCode, remember that the last matching permission rule wins. Broad
   rules must appear before narrow `deny` or `ask` exceptions.
4. For Claude Code, remember that `deny` takes precedence over `ask`, which
   takes precedence over `allow`.
5. Distinguish command syntax differences between `permission.bash` and
   Claude's `Bash(...)` patterns instead of copying rules literally.
6. If the issue is an unexpected prompt, identify the exact path or command,
   the matching rule, its scope, and whether the prompt is intentional.

Use repository search and file reads for inspection. Never expose auth files,
tokens, environment contents, or other secrets while diagnosing a rule.

## Discover

When auditing the policy rather than answering one prompt, discover required
permissions from two sources:

### Current Tooling

- Inspect `Taskfile.yaml`, deployment scripts, shell phases, and relevant tool
  configuration.
- Extract concrete paths, commands, and external-directory access used by the
  repository.
- Compare those requirements with each policy scope. A path used only by
  deployment or dotfiles tooling belongs in the local policy, not automatically
  in the global policy.
- Treat a command as mutating if it can write files, change Git state, alter
  GitHub state, install software, or modify infrastructure, even if its normal
  invocation is read-only.

### Observed Usage

Historical usage inspection is opt-in. Ask before reading OpenCode logs or
Claude history, explain that they may contain conversation text or sensitive
paths, and offer a metadata-only audit first.

If approved, inspect only the minimum needed from likely sources such as:

- OpenCode logs under `~/.local/share/opencode/log/`.
- Claude history under `~/.claude/history.jsonl` and related usage records.

Prefer extracting redacted command/path patterns and occurrence counts. Do not
print prompts, command arguments containing secrets, tokens, environment values,
file contents, or complete history records. Do not treat a historical use as
permission to broaden access; it is evidence to include in the proposal.

Report discoveries in four categories:

- **Required:** confirmed by current tooling or repeated approved usage.
- **Missing:** required but not covered by the appropriate policy scope.
- **Unverified:** observed or inferred, but not sufficiently confirmed.
- **Retirement candidate:** currently allowed but unsupported by current
  tooling and absent from the approved usage window.

Absence from logs is not proof that a permission is unused. A retirement
candidate requires static inspection, an explicitly stated audit window, and a
proposal that identifies the possible impact. Prefer narrowing a wildcard or
moving a rule from global to local scope over deleting it outright.

## Propose Before Editing

Before editing any file, present a proposal and stop for approval. Include:

- The observed drift or requested change.
- Each affected file and scope.
- The exact rules to add, remove, reorder, or change.
- The resulting security implication, including any newly allowed path or
  command.
- Discovery evidence for additions and retirement evidence for removals,
  including whether historical inspection was approved and its audit window.
- Validation commands to run after approval.

Do not infer approval from the original request to inspect or plan. A request
to fix a prompt authorizes analysis, not a permission broadening.

## Apply After Approval

After explicit approval, make the smallest edits needed with the harness's
native editing tools. Keep the four files conceptually aligned while preserving
tool-specific syntax and unrelated settings. Do not create a generator or
duplicate the policy into another source of truth unless the user explicitly
requests that design. Follow the global approval boundary for commits, pushes,
and GitHub state changes.

## Validate

Run the checks relevant to the files changed:

```bash
jq empty claude/settings.json
jq empty .claude/settings.json
python3 -m py_compile claude/snip-hook.py
opencode debug config
```

Run `opencode debug config` once from the dotfiles repository and once from an
unrelated repository when validating local-versus-global behavior. Confirm the
resolved output for the changed path and command patterns, including the
ordering of sensitive exceptions.

Run `claude doctor` for installation/configuration health, but do not claim it
fully resolves Claude permission precedence; Claude has no equivalent resolved
permission dump. Inspect the JSON directly for Claude results.

After deployment, verify these links if global files changed:

```bash
readlink ~/.config/opencode
readlink ~/.claude/settings.json
```

Report validation failures, residual uncertainty, and the final diff. Remind
the user to restart OpenCode or Claude Code after config-time changes.
