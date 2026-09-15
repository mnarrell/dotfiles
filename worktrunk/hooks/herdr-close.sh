#! /usr/bin/env bash
#
# Close the herdr workspace bound to a worktrunk worktree.
#
#   herdr-close.sh <worktree_path>
#
# Wired to worktrunk's pre-remove hook. `pre-*` hooks are BLOCKING -- a nonzero
# exit aborts the operation -- so this must never fail for any reason. Without
# it, `wt remove` deletes the checkout and leaves a herdr workspace pointing at
# a path that no longer exists.
#
# `herdr workspace close` takes a workspace_id, not a path, so the id is
# resolved from `herdr workspace list` by matching .worktree.checkout_path.

set -u

worktree_path="${1:-}"
[ -n "$worktree_path" ] || exit 0

herdr_bin="${HERDR_BIN_PATH:-herdr}"
command -v "$herdr_bin" >/dev/null 2>&1 || exit 0
command -v jq >/dev/null 2>&1 || exit 0

workspace_id=$(
  "$herdr_bin" workspace list 2>/dev/null |
    jq -r --arg p "$worktree_path" \
      '.result.workspaces[]? | select(.worktree.checkout_path == $p) | .workspace_id' |
    head -1
)

[ -n "$workspace_id" ] && "$herdr_bin" workspace close "$workspace_id" >/dev/null 2>&1

exit 0
