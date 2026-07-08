#! /usr/bin/env zsh

# Put Go's bin dir (go install targets) on PATH. GOBIN is set unconditionally in
# golang/env.zsh during the env phase, which runs before this path phase. Array
# form respects the `typeset -U path` dedup configured in zsh/path.zsh; the
# (N-/) qualifier drops the entry if the dir doesn't exist yet (N = nullglob,
# - = follow symlinks, / = directory only).
path=($path ${GOBIN}(N-/))
