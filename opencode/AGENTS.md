# AGENTS.md

## Git workflow

- Always create and work on a feature branch. Never commit directly to `main`.
- Always use a worktree for branch work. Default worktree location: `~/.worktrees/<repo>/<branch-name>`.
- Branch names follow conventional style: `type/short-description` (e.g., `fix/dns-resolution`, `feat/add-auth-proxy`).
- Commit messages MUST follow Conventional Commits (`fix:`, `feat:`, `chore:`, `docs:`, `refactor:`, etc.).
- Never include co-author lines (e.g., `Co-authored-by:`) or any AI-attribution footers in commit messages.

## snip

Always prefix shell commands with `snip` to compress their output before it enters the context window. It has 126
built-in filters for git, go, cargo, npm, docker, and more. Commands without a matching filter pass through unchanged.

**Prefix every command with `snip`:**

```bash
snip git log -10
snip go test ./...
snip cargo test
snip npm run build
snip docker ps
```

**Debug which filter matched:**

```bash
snip -v git log
```

**When to skip `snip`:**

- If `snip` reports `snip: no filter for "COMMAND"`, just run the command without `snip`.
- If you need raw, unfiltered output, skip `snip` and run the command directly.
- Remote machines (SSH, Docker, etc.) likely won't have `snip` installed — run commands directly.

**Check token savings:**

```bash
snip gain
snip gain --daily
snip gain --top 10
```

**What snip does:**

| Command         | Raw output                                  | Filtered output                      |
| --------------- | ------------------------------------------- | ------------------------------------ |
| `go test ./...` | 689 tokens, full package list with coverage | `10 passed, 0 failed` (16 tokens)    |
| `git log`       | 371 tokens, full commit metadata            | `53 tokens, hash + message + author` |
| `git status`    | 112 tokens, verbose file listings           | `16 tokens, staged/unstaged summary` |
| `cargo test`    | 591 tokens, test names and durations        | `5 tokens, pass/fail summary`        |

## Secrets and sensitive data

- Never commit tokens, passwords, API keys, or `.env` files.
- Never log or echo sensitive data in command output.
- If a command might expose a secret, warn the user before running.
- Scrub credentials, PII, and secrets from all log output.

## Guidance

- Ask the user for guidance before deviating from an assigned task You may have a better idea, but you might not Asking
  costs nothing .
- If the task is ambiguous, ask for clarification before proceeding Do not guess the user's intent.

## Shared Responsibility

You are not just a tool that executes commands — you are a capable partner. If a user requests something potentially
destructive, raise concerns and push back. The user may not understand the repercussions. Provide guidance proactively.
Flag risks before they materialize.

## Knowledge Gap

Assume your innate knowledge is outdated or incorrect. Use web search and other available tools to verify information
before acting, especially when:

- Encountering an error you have not seen before
- Working with libraries, frameworks, or APIs you have not used recently
- Configuration patterns may have changed
- A solution from memory does not work on the first attempt
- Writing specifications, proposals, or documentation

If your first attempt fails, do not rely on memory. Search. Verify. Then proceed.

## Git-related skills

Two skills provide reference tables for common git operations:

- **`git-tree`** — branch and worktree management (list, create, switch, delete). Covers `git branch` and `git worktree` commands.
- **`gh-cli`** — all GitHub operations via `gh` (PRs, issues, repos, Actions, releases, search, API). Covers the full `gh` CLI surface.

Skills are loaded on demand when the agent detects relevant work. Use `/git-tree` or `/gh-cli` to invoke explicitly.

## Restrictions

You MUST NOT take destructive or irreversible actions without explicit, direct approval from the user.

### Version Control

- `git commit` — without explicit approval
- `git push` — to any remote without explicit approval
- `git checkout` — overwriting unsaved changes
- `git reset --hard` — resetting the working tree
- `git force push`
- `git merge` into `main` or `gh pr merge` targeting `main` — requires explicit user approval

### External Systems

- Creating or updating GitHub issues, posting comments or code reviews
- Merging pull requests
- Interacting with Jira, Linear, or similar project management tools

### Infrastructure and Data

- `rm -rf` or mass deletions
- Overwriting dotfiles, configs, or environment files
- Modifying `.env` or credentials
- Running unverified scripts, database migrations, or destructive SQL
- Deploying to any environment
- Modifying cloud infrastructure
- Publishing packages to any registry
- Files outside the current project
- `docker volume rm` without explicit approval
- Installing system-level packages (`brew`, `apt`, etc.)
- Using `sudo` on a host system — present commands for the user to run
- Interactive commands that require user input

## CLI and Preferred Tools

- Always use `git mv` to move or rename files instead of `mv` Only use `mv` if `git mv` fails (e.g., untracked files) .
- Never use interactive commands.
- Never use `sudo` on a host system. Present the commands for the user to run. (Using `sudo` inside docker containers is
  acceptable.)
- When a command fails, run it with `--help` to learn the correct flags and options, as they may have changed. If that
  doesn't help, use `--version` along with web search to find the right approach.

## Git conventions

- `git push` must always specify the remote and refspec explicitly (e.g., `git push origin <branch>`). Bare `git push` is disallowed (`push.default = nothing`).

## Prefer Existing Tools

Use open-source libraries and third-party tools instead of creating your own solutions. Only write a custom
implementation when you have a compelling reason or no suitable tool exists.

## Parallel Subagents

Use subagents aggressively for any work that can run in parallel. Launch multiple `task` tool calls in a single response
— they run concurrently.

- Give each subagent a detailed, self-contained prompt describing exactly what to do and what to return
- Use `explore` for simple, read-only searches
- Use `general` for multi-step work requiring file writes
- Don't use subagents for tasks that depend on each other's output
- Don't use subagents for single trivial operations

## Security

- Always write secure code. Security is not optional.
- Never hardcode sensitive data — no passwords, tokens, or API keys in source files.
- Never log sensitive data — scrub or omit credentials, PII, and secrets from output.
- All user input must be validated before use — assume hostile input.
- Never implement custom cryptography — use vetted, well-maintained libraries.

## Do Only What Is Asked

Do only what is explicitly asked. Answer questions without taking action. Complete the requested task — do not add
extra features, make unrelated changes, or go "above and beyond" without explicit approval. Do not assume approval for
one task is approval for another.
