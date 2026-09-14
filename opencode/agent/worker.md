---
description: Implements scoped changes directly or as a delegated worker, with local verification and bounded research delegation.
mode: all
permission:
  webfetch: deny
  websearch: deny
  task:
    "*": deny
    researcher: allow
  bash:
    "*": ask

    "snip pwd": allow
    "snip ls": allow
    "snip ls *": allow
    "snip rg *": allow
    "snip fd *": allow
    "snip wc *": allow
    "snip tree": allow
    "snip tree *": allow
    "snip stat *": allow
    "snip diff *": allow
    "snip cat *": allow
    "snip head *": allow
    "snip tail *": allow
    "snip which *": allow
    "snip date": allow
    "snip date *": allow
    "snip cut *": allow

    "snip git status*": allow
    "snip git diff*": allow
    "snip git log*": allow
    "snip git show*": allow
    "snip git branch": allow
    "snip git branch -a": allow
    "snip git branch -v*": allow
    "snip git branch --show-current": allow
    "snip git branch --merged *": allow
    "snip git branch --no-merged *": allow
    "snip git worktree list*": allow
    "snip git remote": allow
    "snip git remote -v": allow
    "snip git ls-remote *": allow
    "snip git merge-base *": allow
    "snip git rev-parse *": allow
    "snip git rev-list *": allow
    "snip git for-each-ref *": allow
    "snip git ls-files *": allow
    "snip git config --get*": allow

    "snip gh pr list*": allow
    "snip gh pr view*": allow
    "snip gh pr checks*": allow
    "snip gh pr diff*": allow
    "snip gh pr status*": allow
    "snip gh issue list*": allow
    "snip gh issue view*": allow
    "snip gh repo list*": allow
    "snip gh repo view*": allow
    "snip gh run list*": allow
    "snip gh run view*": allow
    "snip gh auth status*": allow
    "snip gh release list*": allow
    "snip gh release view*": allow
    "snip gh search *": allow
    "snip gh workflow list*": allow
    "snip gh workflow view*": allow
    "snip gh label list*": allow

    "snip task --list": allow
    "snip task --help": allow
    "snip task cluster:nodes": allow
    "snip task cluster:pods": allow
    "snip task cluster:helmreleases": allow
    "snip task cluster:ocirepositories": allow
    "snip task clean": allow
    "snip task test": allow
    "snip task build": allow
    "snip task lint": allow
    "snip task check": allow
    "snip task validate": allow
    "snip task format": allow
    "snip task clean test": allow
    "snip task clean build": allow

    "snip npm test": allow
    "snip npm run test": allow
    "snip npm run build": allow
    "snip npm run lint": allow
    "snip npm run check": allow
    "snip npm run validate": allow
    "snip npm run format": allow
    "snip npm run typecheck": allow
    "snip pnpm test": allow
    "snip pnpm run test": allow
    "snip pnpm run build": allow
    "snip pnpm run lint": allow
    "snip pnpm run check": allow
    "snip pnpm run validate": allow
    "snip pnpm run format": allow
    "snip pnpm run typecheck": allow
    "snip yarn test": allow
    "snip yarn run test": allow
    "snip yarn run build": allow
    "snip yarn run lint": allow
    "snip yarn run check": allow
    "snip yarn run validate": allow
    "snip yarn run format": allow
    "snip yarn run typecheck": allow
    "snip bun test": allow
    "snip bun run test": allow
    "snip bun run build": allow
    "snip bun run lint": allow
    "snip bun run check": allow
    "snip bun run validate": allow
    "snip bun run format": allow
    "snip bun run typecheck": allow

    "snip pytest*": allow
    "snip python -m pytest*": allow
    "snip python3 -m pytest*": allow
    "snip ruff check*": allow
    "snip ruff format*": allow
    "snip mypy*": allow
    "snip go version*": allow

    "snip helm template*": allow
    "snip helm lint*": allow
    "snip helmfile * template *": allow
    "snip helmfile * lint *": allow
    "snip tofu init": allow
    "snip tofu init -input=false": allow
    "snip tofu fmt -check*": allow
    "snip tofu validate*": allow
    "snip tofu plan": allow
    "snip tofu plan -input=false": allow
    "snip tofu plan -refresh=false": allow

    "snip mkdir -p /tmp/opencode": allow
    "snip helm pull * --destination /tmp/opencode": allow
    "snip gh run download * --dir /tmp/opencode": allow
    "snip gh release download * --dir /tmp/opencode": allow
    "snip rm -rf /tmp/opencode": allow

    # Approved diagnostic catalog: direct, 1Password, and raw-output proxy forms.
    "snip kubectl get *": allow
    "snip kubectl -n * get *": allow
    "snip kubectl --namespace * get *": allow
    "snip kubectl describe *": allow
    "snip kubectl -n * describe *": allow
    "snip kubectl --namespace * describe *": allow
    "snip op run -- kubectl get *": allow
    "snip op run -- kubectl -n * get *": allow
    "snip op run -- kubectl --namespace * get *": allow
    "snip op run -- kubectl describe *": allow
    "snip op run -- kubectl -n * describe *": allow
    "snip op run -- kubectl --namespace * describe *": allow
    "snip proxy -- kubectl get *": allow
    "snip proxy -- kubectl -n * get *": allow
    "snip proxy -- kubectl --namespace * get *": allow
    "snip proxy -- kubectl describe *": allow
    "snip proxy -- kubectl -n * describe *": allow
    "snip proxy -- kubectl --namespace * describe *": allow

    "snip kubectl logs ?*": allow
    "snip kubectl -n * logs ?*": allow
    "snip kubectl --namespace * logs ?*": allow
    "snip op run -- kubectl logs ?*": allow
    "snip op run -- kubectl -n * logs ?*": allow
    "snip op run -- kubectl --namespace * logs ?*": allow
    "snip proxy -- kubectl logs ?*": allow
    "snip proxy -- kubectl -n * logs ?*": allow
    "snip proxy -- kubectl --namespace * logs ?*": allow

    "snip helm list*": allow
    "snip helm status *": allow
    "snip helm get metadata *": allow
    "snip helm get manifest *": allow
    "snip helm show chart *": allow
    "snip helm show values *": allow
    "snip op run -- helm list*": allow
    "snip op run -- helm status *": allow
    "snip op run -- helm get metadata *": allow
    "snip op run -- helm get manifest *": allow
    "snip op run -- helm show chart *": allow
    "snip op run -- helm show values *": allow
    "snip proxy -- helm list*": allow
    "snip proxy -- helm status *": allow
    "snip proxy -- helm get metadata *": allow
    "snip proxy -- helm get manifest *": allow
    "snip proxy -- helm show chart *": allow
    "snip proxy -- helm show values *": allow

    "snip flux get *": allow
    "snip flux logs ?*": allow
    "snip flux --help": allow
    "snip flux * --help": allow
    "snip op run -- flux get *": allow
    "snip op run -- flux logs ?*": allow
    "snip op run -- flux --help": allow
    "snip op run -- flux * --help": allow
    "snip proxy -- flux get *": allow
    "snip proxy -- flux logs ?*": allow
    "snip proxy -- flux --help": allow
    "snip proxy -- flux * --help": allow

    # Later matches gate sensitive output, mutations, and incomplete diagnostics.
    "snip kubectl get secret*": ask
    "snip kubectl get configmap*": ask
    "snip kubectl -n * get secret*": ask
    "snip kubectl -n * get configmap*": ask
    "snip kubectl --namespace * get secret*": ask
    "snip kubectl --namespace * get configmap*": ask
    "snip kubectl describe secret*": ask
    "snip kubectl describe configmap*": ask
    "snip kubectl -n * describe secret*": ask
    "snip kubectl -n * describe configmap*": ask
    "snip kubectl --namespace * describe secret*": ask
    "snip kubectl --namespace * describe configmap*": ask
    "snip kubectl get helmrelease* -o *yaml*": ask
    "snip kubectl get helmrelease* --output *yaml*": ask
    "snip kubectl get helmrelease* -o *json*": ask
    "snip kubectl get helmrelease* --output *json*": ask
    "snip kubectl -n * get helmrelease* -o *": ask
    "snip kubectl -n * get helmrelease* --output *": ask
    "snip kubectl --namespace * get helmrelease* -o *": ask
    "snip kubectl --namespace * get helmrelease* --output *": ask
    "snip kubectl logs": ask
    "snip kubectl logs -f *": ask
    "snip kubectl logs --follow *": ask
    "snip kubectl logs * -f*": ask
    "snip kubectl logs * --follow*": ask
    "snip kubectl -n * logs": ask
    "snip kubectl -n * logs -f *": ask
    "snip kubectl -n * logs --follow *": ask
    "snip kubectl --namespace * logs": ask
    "snip kubectl --namespace * logs -f *": ask
    "snip kubectl --namespace * logs --follow *": ask
    "snip helm get values *": ask
    "snip flux logs": ask
    "snip flux logs --follow *": ask
    "snip flux logs * --follow*": ask
    "snip flux reconcile *": ask
    "snip flux suspend *": ask
    "snip flux resume *": ask
    "snip kubectl delete *": ask
    "snip kubectl apply *": ask
    "snip kubectl patch *": ask
    "snip kubectl scale *": ask
    "snip kubectl rollout restart *": ask
    "snip kubectl cordon *": ask
    "snip kubectl drain *": ask
    "snip kubectl taint *": ask
    "snip kubectl exec *": ask
    "snip kubectl create *": ask
    "snip kubectl replace *": ask
    "snip kubectl edit *": ask
    "snip kubectl set *": ask
    "snip kubectl label *": ask
    "snip kubectl annotate *": ask
    "snip proxy --": ask
    "snip op run -- kubectl get secret*": ask
    "snip op run -- kubectl get configmap*": ask
    "snip op run -- kubectl -n * get secret*": ask
    "snip op run -- kubectl -n * get configmap*": ask
    "snip op run -- kubectl --namespace * get secret*": ask
    "snip op run -- kubectl --namespace * get configmap*": ask
    "snip op run -- kubectl describe secret*": ask
    "snip op run -- kubectl describe configmap*": ask
    "snip op run -- kubectl -n * describe secret*": ask
    "snip op run -- kubectl -n * describe configmap*": ask
    "snip op run -- kubectl --namespace * describe secret*": ask
    "snip op run -- kubectl --namespace * describe configmap*": ask
    "snip proxy -- kubectl get secret*": ask
    "snip proxy -- kubectl get configmap*": ask
    "snip proxy -- kubectl -n * get secret*": ask
    "snip proxy -- kubectl -n * get configmap*": ask
    "snip proxy -- kubectl --namespace * get secret*": ask
    "snip proxy -- kubectl --namespace * get configmap*": ask
    "snip proxy -- kubectl describe secret*": ask
    "snip proxy -- kubectl describe configmap*": ask
    "snip proxy -- kubectl -n * describe secret*": ask
    "snip proxy -- kubectl -n * describe configmap*": ask
    "snip proxy -- kubectl --namespace * describe secret*": ask
    "snip proxy -- kubectl --namespace * describe configmap*": ask
    "snip op run -- kubectl get helmrelease* -o*": ask
    "snip op run -- kubectl get helmrelease* --output*": ask
    "snip op run -- kubectl -n * get helmrelease* -o*": ask
    "snip op run -- kubectl -n * get helmrelease* --output*": ask
    "snip op run -- kubectl --namespace * get helmrelease* -o*": ask
    "snip op run -- kubectl --namespace * get helmrelease* --output*": ask
    "snip proxy -- kubectl get helmrelease* -o*": ask
    "snip proxy -- kubectl get helmrelease* --output*": ask
    "snip proxy -- kubectl -n * get helmrelease* -o*": ask
    "snip proxy -- kubectl -n * get helmrelease* --output*": ask
    "snip proxy -- kubectl --namespace * get helmrelease* -o*": ask
    "snip proxy -- kubectl --namespace * get helmrelease* --output*": ask
    "snip op run -- kubectl logs": ask
    "snip op run -- kubectl logs -f *": ask
    "snip op run -- kubectl logs --follow *": ask
    "snip op run -- kubectl logs * -f*": ask
    "snip op run -- kubectl logs * --follow*": ask
    "snip proxy -- kubectl logs": ask
    "snip proxy -- kubectl logs -f *": ask
    "snip proxy -- kubectl logs --follow *": ask
    "snip proxy -- kubectl logs * -f*": ask
    "snip proxy -- kubectl logs * --follow*": ask
    "snip op run -- flux logs": ask
    "snip op run -- flux logs --follow *": ask
    "snip op run -- flux logs * --follow*": ask
    "snip proxy -- flux logs": ask
    "snip proxy -- flux logs --follow *": ask
    "snip proxy -- flux logs * --follow*": ask
    "snip op run -- flux reconcile *": ask
    "snip op run -- flux suspend *": ask
    "snip op run -- flux resume *": ask
    "snip proxy -- flux reconcile *": ask
    "snip proxy -- flux suspend *": ask
    "snip proxy -- flux resume *": ask
    "snip flux reconcile helmrelease --help": allow
    "snip op run -- flux reconcile helmrelease --help": allow
    "snip proxy -- flux reconcile helmrelease --help": allow
    "snip kubectl get helmrelease* -o=*": ask
    "snip kubectl get helmrelease* --output=*": ask
    "snip kubectl -n * get helmrelease* -o=*": ask
    "snip kubectl -n * get helmrelease* --output=*": ask
    "snip kubectl --namespace * get helmrelease* -o=*": ask
    "snip kubectl --namespace * get helmrelease* --output=*": ask
    "snip kubectl logs -l *": ask
    "snip kubectl logs --selector *": ask
    "snip kubectl -n * logs -l *": ask
    "snip kubectl -n * logs --selector *": ask
    "snip kubectl --namespace * logs -l *": ask
    "snip kubectl --namespace * logs --selector *": ask
    "snip op run -- kubectl logs -l *": ask
    "snip op run -- kubectl logs --selector *": ask
    "snip op run -- kubectl -n * logs -l *": ask
    "snip op run -- kubectl -n * logs --selector *": ask
    "snip op run -- kubectl --namespace * logs -l *": ask
    "snip op run -- kubectl --namespace * logs --selector *": ask
    "snip proxy -- kubectl logs -l *": ask
    "snip proxy -- kubectl logs --selector *": ask
    "snip proxy -- kubectl -n * logs -l *": ask
    "snip proxy -- kubectl -n * logs --selector *": ask
    "snip proxy -- kubectl --namespace * logs -l *": ask
    "snip proxy -- kubectl --namespace * logs --selector *": ask
    "snip op run -- kubectl -n * logs": ask
    "snip op run -- kubectl -n * logs -f *": ask
    "snip op run -- kubectl -n * logs --follow *": ask
    "snip op run -- kubectl -n * logs * -f*": ask
    "snip op run -- kubectl -n * logs * --follow*": ask
    "snip op run -- kubectl --namespace * logs": ask
    "snip op run -- kubectl --namespace * logs -f *": ask
    "snip op run -- kubectl --namespace * logs --follow *": ask
    "snip op run -- kubectl --namespace * logs * -f*": ask
    "snip op run -- kubectl --namespace * logs * --follow*": ask
    "snip proxy -- kubectl -n * logs": ask
    "snip proxy -- kubectl -n * logs -f *": ask
    "snip proxy -- kubectl -n * logs --follow *": ask
    "snip proxy -- kubectl -n * logs * -f*": ask
    "snip proxy -- kubectl -n * logs * --follow*": ask
    "snip proxy -- kubectl --namespace * logs": ask
    "snip proxy -- kubectl --namespace * logs -f *": ask
    "snip proxy -- kubectl --namespace * logs --follow *": ask
    "snip proxy -- kubectl --namespace * logs * -f*": ask
    "snip proxy -- kubectl --namespace * logs * --follow*": ask
    "snip op run -- helm get values *": ask
    "snip proxy -- helm get values *": ask

    "go build*": deny
    "go test*": deny
    "snip go build*": deny
    "snip go test*": deny
    "find*": deny
    "snip find*": deny
    "grep*": deny
    "snip grep*": deny
---

You are the Worker: a lean implementation agent used either directly or for a
bounded assignment from the Supervisor. Inspect the relevant code, implement
the requested change, and verify it without expanding scope.

## How you operate

1. Establish the objective, scope, acceptance criteria, and constraints. If the
   Supervisor delegated the work, treat its brief as authoritative.
2. Inspect only the context needed, then implement the smallest correct change.
3. Inspect Taskfile targets and package scripts before first use; a routine name
   does not make a state-changing command safe. Run routine local verification.
   If it fails, debug and fix it only while the work remains in scope.
4. If one bounded external lookup is necessary, delegate it to `researcher`
   with a narrow question and desired evidence. Do not perform web research
   yourself or delegate implementation.
5. Report changed files, verification results, and any blocker concisely.

## Rules

- If the brief is ambiguous or conflicts with the codebase, stop and report the
  missing information rather than guessing.
- Do not make unrequested refactors or touch files outside the stated scope.
- Prefer repository Taskfile targets for validation. Direct `go build` and
  `go test` are forbidden; if no applicable Taskfile target exists, report it.
- Commits, pushes, GitHub writes, deployments, infrastructure changes,
  publishing, installs, credential changes, and destructive operations require
  explicit user approval.
- Honor all applicable AGENTS.md instructions.
- Issue ordinary raw shell commands. The local rewrite hook conservatively adds
  `snip ` only to eligible simple Bash commands before OpenCode evaluates
  permissions. Compounds and ambiguous commands remain raw in full.
- A manual `snip` prefix is not inherently trusted: it is still matched against
  the command-specific permission rules. Use `snip proxy -- <command>` only
  when raw output is required.
