---
name: git-tree
description: "Use this skill when working with git branches or worktrees. Covers listing, creating, switching, and deleting branches and worktrees."
---

## Rules

1. **Always use a worktree** for branch work. Default location: `~/.worktrees/<repo>/<branch-name>`.
2. **Never commit directly to `main`.** Create a feature branch first.
3. Branch names follow conventional style: `type/short-description` (e.g., `fix/dns-resolution`, `feat/add-auth-proxy`).
4. Only skip worktrees when the user explicitly says not to use one.

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

The primary workflow is `git worktree add` — it creates the branch and worktree in one step.

| Task | Command |
|---|---|
| **Create branch + worktree (preferred)** | `snip git worktree add ~/.worktrees/<repo>/<name> -b <name>` |
| Add worktree for existing branch | `snip git worktree add <path> <branch>` |
| List worktrees | `snip git worktree list` |
| Switch worktree | `snip git worktree switch <path>` |
| Remove worktree | `snip git worktree remove <path>` |
| Prune stale references | `snip git worktree prune` |

## Tips

- Worktrees share `.git` — commits and history are visible across all of them
- A branch checked out in a worktree cannot be `checkout`ed elsewhere; use `git worktree switch`
- Run `git worktree prune` after manually deleting worktree directories
- `git worktree list --porcelain` gives machine-readable output
- Each worktree can have its own uncommitted changes without affecting others
