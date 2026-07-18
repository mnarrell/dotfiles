# Git Trees in opencode

How to use branch and worktree management in opencode.

## The `/git-tree` command

Type `/git` in the prompt — it autocompletes to `/git-tree`. Press enter.

The agent runs `git worktree list` and `git branch -v`, then shows you a formatted summary of every active branch and worktree with HEAD, upstream, and age.

### Examples

**See everything at a glance:**

```text
> /git-tree
```

The agent responds with something like:

```text
BRANCH                TYPE       HEAD     UPSTREAM          AGE           MODIFIED
main                  branch     abc1234  origin/main       2 hours       0
feat/auth             worktree   def5678  origin/feat/auth   3 days        5
fix/timeout           branch     ghi9012  -                  1 week        0
```

**Pass arguments directly:**

```text
> /git-tree create feat/new-thing
```

The agent translates this to `git checkout -b feat/new-thing` and executes it.

```text
> /git-tree switch feat/auth
```

The agent switches to that branch or worktree.

---

## Talking to the agent naturally

You don't have to use the command. Just ask in plain language — the agent loads the git-tree skill automatically when it detects branch or worktree work.

### "what branches are active?"

The agent runs `snip git worktree list` and `snip git branch -v`, then presents a clean summary.

### "create a worktree for the auth feature"

The agent runs:

```bash
snip git worktree add ../project-auth -b feat/auth
```

It creates both the branch and the worktree in one step, then tells you where the new directory is.

### "switch to the auth worktree"

The agent finds the right worktree and runs `snip git worktree switch` or `snip git checkout` as appropriate.

### "what's stale?"

The agent checks each branch's last commit age and how far behind main it is, then tells you which ones are old and safe to delete.

### "clean up the auth feature"

The agent removes the worktree (if it exists) and deletes the merged branch:

```bash
snip git worktree remove ../project-auth
snip git branch -d feat/auth
```

### "review my teammate's PR"

The agent fetches their branch and creates a temporary worktree:

```bash
snip git fetch origin feat/teammate-feature
snip git worktree add ../review feat/teammate-feature
```

You review in `../review`, then tell the agent to clean up when done.

---

## How it works under the hood

1. You type something about branches/worktrees
2. Agent recognizes the intent and loads the `git-tree` skill
3. The skill provides reference tables of git commands
4. Agent executes the right commands via `bash`, prefixing with `snip`
5. Results are presented in a clean format

The skill stays out of context until needed — it's loaded on demand, not every session.

---

## Tips

- The `/git-tree` command is a quick shortcut for "show me what's active"
- For anything beyond listing, just ask naturally — "create a branch", "switch to X", "clean up old branches"
- The agent knows to check for uncommitted changes before switching or deleting
- Worktrees are just directories — you can `cd` into them, open them in your editor, run tests, etc.
- If something goes wrong, ask the agent to explain what happened — it can read git status and help you recover
