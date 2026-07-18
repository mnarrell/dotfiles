---
description: List and manage git branches and worktrees
---

List all git branches and worktrees with their status.

Run these commands and present a clean summary:

1. Branches: `snip git branch -v`
2. Worktrees: `snip git worktree list`

Format the output as a table showing name, type, HEAD, and current status.
If arguments are provided, treat them as a git branch/worktree command (e.g., `git-tree create foo` becomes `git checkout -b foo`).
