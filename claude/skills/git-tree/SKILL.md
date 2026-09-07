---
name: git-tree
description: "Use for Git branch or worktree operations, including creation, switching, deletion, and PR preparation."
---

## Branch Workflow

Create a feature branch before making changes; never commit directly to `main`.
Use `type/short-description` names, such as `fix/dns-resolution`. Before opening or
updating a PR, rebase onto `origin/main`; keep `main` linear and squash-merge PRs.

Use a worktree only when the user asks or concurrent workers need isolated checkouts.
The default location is `~/.worktrees/<repo>/<branch-name>`.

## Inspection

```bash
git status --short
git branch -v
git worktree list
```

## State Changes

- Inspect status before switching branches or worktrees. Ask before a checkout that could overwrite changes.
- Ask before deleting branches or worktrees, pruning worktrees, committing, pushing, merging, or force operations.
- Use `git push origin <branch>` or `git push -u origin <branch>`; never use a bare push.
- Use `git mv` for tracked-file moves. Use plain `mv` only for untracked files or after `git mv` fails.
