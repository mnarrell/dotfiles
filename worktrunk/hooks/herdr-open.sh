#! /usr/bin/env bash
#
# Open (or focus) a herdr workspace for a worktrunk worktree.
#
#   herdr-open.sh <worktree_path> <repo_path> <branch>
#
# Wired to worktrunk's post-start and post-switch hooks. Best-effort by design:
# every failure path exits 0 so a stopped herdr server, a missing binary, or a
# half-installed state can never break `wt`. See worktrunk/config.toml.
#
# `herdr worktree open` needs BOTH --cwd (the parent repo, to resolve which
# repository the checkout belongs to) and --path (the checkout itself). Passing
# --path alone returns worktree_not_found.

set -u

worktree_path="${1:-}"
repo_path="${2:-}"
branch="${3:-}"

[ -n "$worktree_path" ] || exit 0
[ -d "$worktree_path" ] || exit 0

# Prefer the running binary herdr hands to plugins; fall back to PATH.
herdr_bin="${HERDR_BIN_PATH:-herdr}"
command -v "$herdr_bin" >/dev/null 2>&1 || exit 0

# Already open? Focus it instead of asking herdr to open a duplicate. This is
# what makes the post-switch hook idempotent.
existing=$(
  "$herdr_bin" workspace list 2>/dev/null |
    jq -r --arg p "$worktree_path" \
      '.result.workspaces[]? | select(.worktree.checkout_path == $p) | .workspace_id' |
    head -1
)

if [ -n "$existing" ]; then
  "$herdr_bin" workspace focus "$existing" >/dev/null 2>&1
  exit 0
fi

"$herdr_bin" worktree open \
  --cwd "$repo_path" \
  --path "$worktree_path" \
  --label "${branch:-$(basename "$worktree_path")}" \
  --focus >/dev/null 2>&1

exit 0
