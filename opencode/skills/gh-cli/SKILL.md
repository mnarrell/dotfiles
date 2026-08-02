---
name: gh-cli
description: "GitHub operations via the `gh` CLI: pull requests, issues, repos, Actions, releases, search, and API."
---

## Quick Start

Verify authentication first:

```
snip gh auth status
```

All `gh` commands support `-R OWNER/REPO` to target a specific repo. When omitted, the current directory's repo is used.

Read-only examples below are prefixed with `snip` to compress output; mutating commands
(create, merge, close, review, ...) are shown bare.

## Pull Requests

```
gh pr create --fill --reviewer HANDLE
snip gh pr list [--state open|closed|all] [--label NAME] [--reviewer ME]
snip gh pr view <NUMBER|URL|BRANCH>
snip gh pr status  # relevant PRs across repos
gh pr review --approve | -r -b "..." | --comment -b "..."
gh pr merge --squash --delete-branch
snip gh pr checks <NUMBER>
snip gh pr diff <NUMBER>
gh pr checkout <NUMBER>
```

Key flags for `pr create`:

- `--fill` / `--fill-first` / `--fill-verbose` — autofill from commits
- `--draft` — create as draft
- `--base BRANCH` — target branch
- `-r HANDLE` — request reviewers (repeatable)
- `-l LABEL` — add labels (repeatable)

Use `Resolves #N` in the body for auto-closure.

## Issues

```
gh issue create --title "TITLE" --body "BODY"
snip gh issue list [--state open|closed|all] [--label NAME] [--assignee HANDLE]
snip gh issue view <NUMBER|URL>
gh issue comment <NUMBER> -b "COMMENT"
gh issue close <NUMBER>
gh issue edit <NUMBER> --title "..." --label "..."
```

Key flags for `issue create`:

- `-l LABEL` — add labels (repeatable)
- `-a HANDLE` — assign (use `@me` or `@copilot`)
- `-T TEMPLATE` — use issue template

## Repos, Actions, Releases

```
gh repo clone OWNER/REPO
gh repo fork OWNER/REPO
gh repo create [--private|--public]
snip gh repo list [--visibility public|private|all]

snip gh run list
snip gh run view <RUN_ID>
gh run watch <RUN_ID>
gh run cancel <RUN_ID>
gh run rerun <RUN_ID>

gh release create TAG --title "TITLE" --notes "NOTES"
snip gh release list
snip gh release view TAG
gh release upload TAG FILE
gh release download TAG --output FILE
```

For destructive commands (`repo delete`, `release delete`, `run delete`), confirm with the user first.

## Search

```
snip gh search issues "QUERY"
snip gh search prs "QUERY"
snip gh search repos "QUERY"
snip gh search code "QUERY"
snip gh search commits "QUERY"
```

Use `--` before queries with hyphens to avoid flag parsing:

```
snip gh search issues -- "is:open -label:bug"
```

## API Requests

For anything not covered by built-in commands:

```
snip gh api repos/{owner}/{repo}/releases
snip gh api repos/{owner}/{repo}/issues --jq '.[].title'
```

Key flags:

- `-X METHOD` — HTTP method (default GET, auto POST with params)
- `-f key=value` — string parameter
- `-F key=value` — typed parameter (auto-converts booleans/numbers, `@file` reads from file)
- `--jq 'QUERY'` — filter output with jq
- `--paginate` — fetch all pages
- `{owner}`, `{repo}`, `{branch}` — auto-resolved placeholders

### Nested parameters and GraphQL

```
snip gh api endpoint -F 'key[sub]=val' -F 'arr[]=a' -F 'arr[]=b'
snip gh api graphql -f query='query { viewer { name } }' -F var='value'
```

## Output Formatting

Append to any command producing JSON:

```
--jq '.field'          # jq filter
--json FIELD,FIELD     # specific fields as JSON
```

## PR Lifecycle

1. Push branch: `git push -u origin BRANCH`
2. Create PR: `gh pr create --fill`
3. Check CI: `snip gh pr checks`
4. Review: `gh pr review --approve`
5. Merge: `gh pr merge --squash --delete-branch`
