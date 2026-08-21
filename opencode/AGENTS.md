# AGENTS.md

Global operating rules. Command reference tables live in on-demand skills — `git-tree` (branches/worktrees), `gh-cli`
(GitHub via `gh`), and `snip` (output compression).

## Working style

- **Do only what is asked.** Answer questions without taking action; don't add features, refactors, or "above and
  beyond" changes without explicit approval. Approval for one task is not approval for another.
- Ask before deviating from an assigned task, or when intent is ambiguous — don't guess. Asking costs nothing.
- Push back on destructive or risky requests before they run; the user may not see the repercussions. You are a partner,
  not just a command runner.
- Assume your own knowledge may be stale. Search and verify before acting on unfamiliar errors, libraries, APIs, or
  config patterns — especially after a first attempt fails.
- Prefer existing, well-maintained tools and libraries over custom implementations.

## Git

Branch, worktree, and GitHub mechanics live in the `git-tree` and `gh-cli` skills.

- **GitHub operations must use `gh`.** For GitHub-hosted issues, pull requests, reviews, Actions, releases, repository
  metadata, search, and API requests, load the `gh-cli` skill and use `gh` (prefix read-only commands with `snip`). Do
  not substitute `curl`, `WebFetch`, browser/web search, raw HTTP requests, or `git` remote commands. Treat every
  `github.com` URL as a GitHub operation, including URLs pasted by the user, and translate it to the appropriate `gh`
  command, such as `snip gh pr view <URL> --comments`. If `gh` cannot perform the operation, stop and report the
  limitation rather than silently switching tools.

- Always work on a feature branch; never commit to `main`. Use a worktree (`~/.worktrees/<repo>/<branch-name>`) only
  when asked, or running muliple workers in parallel.
- Branch names: `type/short-description` (e.g. `fix/dns-resolution`, `feat/add-auth-proxy`).
- Conventional Commits (`fix:`, `feat:`, `chore:`, `docs:`, `refactor:`). No co-author or AI-attribution footers.
- Keep `main` linear: rebase onto `origin/main` before opening or updating a PR, never merge `main` into a branch, and
  squash-merge PRs.
- `git push` must name the remote and refspec (`git push origin <branch>`); bare `push` is disabled (`push.default =
nothing`).
- Use `git mv` to move/rename tracked files; use plain `mv` only when `git mv` fails (untracked).

## Approval required (destructive / irreversible)

Never do these without explicit user approval:

- **Git:** `commit`, `push`, `checkout`/`reset --hard` over unsaved changes, force-push, `merge` or `gh pr merge` into
  `main`.
- **External systems:** create or update GitHub issues, PR comments, or reviews; merge PRs; Jira/Linear/etc. changes.
- **Infra & data:** `rm -rf` or mass deletes, overwriting dotfiles/configs/`.env` or credentials, running unverified
  scripts, DB migrations or destructive SQL, deploys, cloud-infra changes, publishing packages, `docker volume rm`,
  editing files outside the project, or installing system packages (`brew`, `apt`).
- Never run `sudo` on the host — present the command for the user to run. (`sudo` inside a container is fine.)
- Never use interactive commands (they block). When a flag fails, check `--help`.

## Secrets & security

- Never hardcode or log secrets, tokens, keys, PII, or `.env` contents; scrub them from output Warn before running a .
  command that could expose one .
- Validate untrusted input. Never roll your own crypto — use vetted libraries.

## snip

Prefix shell commands with `snip` to compress their output. Skip it when `snip` reports `no filter for "<cmd>"`, when
you need raw output, or on remote machines (SSH/Docker) that lack it. Filters, debugging, and token-savings reference:
the `snip` skill.

## Go projects

- **Taskfile takes precedence.** Before building or testing Go code, check for `Taskfile.yaml`, `Taskfile.yml`, or
  another supported Taskfile name and inspect its available targets with `task --list`.
- When a Taskfile is present, run `task clean test` for the standard test pass and use Taskfile-defined build/test
  targets and variants for other requested checks. Do not substitute `go build` or `go test` while a relevant Taskfile
  target exists. If `task clean test` or a requested target is unavailable, report that limitation rather than silently
  falling back to a direct Go command.
- Direct `go build` or `go test` is appropriate only when no Taskfile exists or the Taskfile has no applicable target.

## Subagents

Use subagents for parallelizable work — launch multiple in a single response. Use `explore` for read-only searches and
`general` for multi-step work with file writes. Don't use them for interdependent steps or single trivial operations.
Give each a self-contained prompt stating exactly what to do and what to return.
