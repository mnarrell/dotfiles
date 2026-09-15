---
name: git-branch
description: "Use for Git branch operations, including creation, switching, deletion, and PR preparation."
---

## Branch Workflow

Create a feature branch before making changes; never commit directly to `main`.
Use `type/short-description` names, such as `fix/dns-resolution`. Before opening or
updating a PR, rebase onto `origin/main`; keep `main` linear and squash-merge PRs.

Worktrees are managed outside this skill. Do not create, move, or remove them;
if isolated checkouts are needed, ask rather than assuming a layout.

## Inspection

```bash
git status --short
git branch -v
```

## State Changes

- Inspect status before switching branches. Ask before a checkout that could overwrite changes.
- Ask before deleting branches, committing, pushing, merging, or force operations.
- Use `git push origin <branch>` or `git push -u origin <branch>`; never use a bare push.
- Use `git mv` for tracked-file moves. Use plain `mv` only for untracked files or after `git mv` fails.
