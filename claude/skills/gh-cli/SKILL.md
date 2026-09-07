---
name: gh-cli
description: "Use for authenticated, private, account-scoped, or structured GitHub operations through the gh CLI."
---

## Routing

Use public HTTPS through WebFetch for public GitHub pages, files, documentation,
and artifacts. If that is insufficient because the resource is private, requires
authentication, or needs structured GitHub functionality, use `gh` without asking
again. Run `gh auth status` only when the authenticated fallback is needed.

This routing applies to GitHub web and API access. Standard Git transport, such as
fetching an existing remote branch, remains a Git workflow; load `git-tree` when it
involves branches or worktrees.

All GitHub state changes require explicit user approval. Treat `gh api` as approval
required even for an apparent GET because its flags can change the request method or
send mutation parameters.

## Read Operations

Configured read-only `gh` operations include:

```bash
gh pr list|view|status|checks|diff
gh issue list|view
gh repo list|view
gh run list|view
gh release list|view
gh workflow list|view
gh label list
gh search <issues|prs|repos|code|commits> <query>
```

Use `-R OWNER/REPO` to target a repository outside the current directory. Use
`--json` or `--jq` to request only the needed fields.

## Write Operations

After explicit approval, use `gh` for PR, issue, review, comment, release, workflow,
label, repository, secret, variable, and API mutations. State the exact operation in
the approval request. `gh pr checkout`, `gh repo clone`, and release downloads modify
the local filesystem; follow the applicable Git and file-change safeguards.
