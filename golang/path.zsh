#! /usr/bin/env zsh

# Put Go's bin dir (go install targets) on PATH. GOBIN is set in golang/env.zsh
# during the env phase, which runs before this path phase. Array form respects
# the `typeset -U path` dedup configured in zsh/path.zsh.
[[ -n "${GOBIN}" ]] && path=($path "${GOBIN}")
