# AGENTS.md

Global operating rules. Command reference tables live in on-demand skills — `git-tree`
(branches/worktrees), `gh-cli` (GitHub via `gh`), and `snip` (output compression).

## Working style

- **Do only what is asked.** Answer questions without taking action; don't add features,
  refactors, or "above and beyond" changes without explicit approval. Approval for one task is
  not approval for another.
- Ask before deviating from an assigned task, or when intent is ambiguous — don't guess. Asking
  costs nothing.
- Push back on destructive or risky requests before they run; the user may not see the
  repercussions. You are a partner, not just a command runner.
- Assume your own knowledge may be stale. Search and verify before acting on unfamiliar errors,
  libraries, APIs, or config patterns — especially after a first attempt fails.
- Prefer existing, well-maintained tools and libraries over custom implementations.

## Git

Worktree-per-branch is **enforced** by `enforce.ts` — edits on `main` are blocked at the tool
level. Branch, worktree, and GitHub mechanics live in the `git-tree` and `gh-cli` skills.

- Work on a feature branch in a worktree at `~/.worktrees/<repo>/<branch-name>`; never commit to
  `main`.
- Branch names: `type/short-description` (e.g. `fix/dns-resolution`, `feat/add-auth-proxy`).
- Conventional Commits (`fix:`, `feat:`, `chore:`, `docs:`, `refactor:`). No co-author or
  AI-attribution footers.
- Keep `main` linear: rebase onto `origin/main` before opening or updating a PR, never merge
  `main` into a branch, and squash-merge PRs.
- `git push` must name the remote and refspec (`git push origin <branch>`); bare `push` is
  disabled (`push.default = nothing`).
- Use `git mv` to move/rename tracked files; use plain `mv` only when `git mv` fails (untracked).

## Approval required (destructive / irreversible)

Never do these without explicit user approval:

- **Git:** `commit`, `push`, `checkout`/`reset --hard` over unsaved changes, force-push,
  `merge` or `gh pr merge` into `main`.
- **External systems:** create or update GitHub issues, PR comments, or reviews; merge PRs;
  Jira/Linear/etc. changes.
- **Infra & data:** `rm -rf` or mass deletes, overwriting dotfiles/configs/`.env` or
  credentials, running unverified scripts, DB migrations or destructive SQL, deploys, cloud-infra
  changes, publishing packages, `docker volume rm`, editing files outside the project, or
  installing system packages (`brew`, `apt`).
- Never run `sudo` on the host — present the command for the user to run. (`sudo` inside a
  container is fine.)
- Never use interactive commands (they block). When a flag fails, check `--help`.

## Secrets & security

- Never hardcode or log secrets, tokens, keys, PII, or `.env` contents; scrub them from output.
  Warn before running a command that could expose one.
- Validate untrusted input. Never roll your own crypto — use vetted libraries.

## snip

Prefix shell commands with `snip` to compress their output. Skip it when `snip` reports
`no filter for "<cmd>"`, when you need raw output, or on remote machines (SSH/Docker) that lack
it. Filters, debugging, and token-savings reference: the `snip` skill.

## Subagents

Use subagents for parallelizable work — launch multiple in a single response. Use `explore` for
read-only searches and `general` for multi-step work with file writes. Don't use them for
interdependent steps or single trivial operations. Give each a self-contained prompt stating
exactly what to do and what to return.
