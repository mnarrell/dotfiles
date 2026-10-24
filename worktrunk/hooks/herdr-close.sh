#! /usr/bin/env bash
#
# Close the herdr workspace bound to a worktrunk worktree.
#
#   herdr-close.sh <worktree_path>
#
# Available for a post-remove hook. It must never fail: hook errors should not
# turn an already-removed checkout into a failed lifecycle operation. The herdr
# worktrunk plugin invokes equivalent cleanup itself, but only after its
# foreground `wt remove` succeeds.
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
