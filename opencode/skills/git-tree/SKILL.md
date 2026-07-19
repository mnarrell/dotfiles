---
name: git-tree
description: "Use this skill when working with git branches or worktrees. Covers listing, creating, switching, and deleting branches and worktrees."
---

## Quick Start

```bash
snip git worktree list
snip git branch
```

## Branches

| Task | Command |
|---|---|
| List local branches | `snip git branch` |
| List all (incl. remote) | `snip git branch -a` |
| Create + switch | `snip git checkout -b <name>` |
| Create only | `snip git branch <name>` |
| Switch | `snip git checkout <name>` |
| Delete (merged) | `snip git branch -d <name>` |
| Delete (force) | `snip git branch -D <name>` |
| Rename | `snip git branch -m <old> <new>` |
| Last commit age | `snip git log -1 --format='%ar' <branch>` |
| Commits ahead of main | `snip git rev-list --count main..<branch>` |
| Show merged into main | `snip git branch --merged main` |
| Show unmerged | `snip git branch --no-merged` |

## Pushing

`push.default` is set to `nothing` — always specify the remote and branch explicitly.

| Task | Command |
|---|---|
| Push current branch | `snip git push origin <branch>` |
| Push and set upstream | `snip git push -u origin <branch>` |
| Push to main | `snip git push origin HEAD:main` |

## Worktrees

| Task | Command |
|---|---|
| List worktrees | `snip git worktree list` |
| Create branch + worktree | `snip git worktree add <path> -b <name>` |
| Add worktree for existing branch | `snip git worktree add <path> <branch>` |
| Switch worktree | `snip git worktree switch <path>` |
| Remove worktree | `snip git worktree remove <path>` |
| Prune stale references | `snip git worktree prune` |

## Tips

- Worktrees share `.git` — commits and history are visible across all of them
- A branch checked out in a worktree cannot be `checkout`ed elsewhere; use `git worktree switch`
- Run `git worktree prune` after manually deleting worktree directories
- `git worktree list --porcelain` gives machine-readable output
- Each worktree can have its own uncommitted changes without affecting others
