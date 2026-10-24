#! /usr/bin/env bash
#
# Trust the .envrc copied into a new worktrunk worktree.
#
#   direnv-allow.sh <worktree_path>
#
# Wired as the second step of worktrunk's post-start pipeline, after
# copy-ignored copies gitignored files (including .envrc) from the primary
# checkout and before the worktree's tmux window opens. Pipeline steps run
# sequentially and a nonzero exit would abort later steps, so this must never
# fail for any reason -- a worktree with no .envrc, or no direnv binary
# installed, is simply a no-op.

set -u

worktree_path="${1:-}"
[ -n "$worktree_path" ] || exit 0

[ -f "$worktree_path/.envrc" ] || exit 0

command -v direnv >/dev/null 2>&1 || exit 0

direnv allow "$worktree_path" >/dev/null 2>&1 || true

exit 0
