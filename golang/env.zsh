#! /usr/bin/env zsh

# Go toolchain vs. workspace. Runs in the env phase, before the path phase, so
# golang/path.zsh can rely on $GOBIN.

# Shared, version-independent workspace (unconditional; no toolchain lookup
# needed, so these stay correct even when `asdf which go` can't resolve yet).
export GOPATH="${XDG_DATA_HOME}/go"
export GOBIN="${GOPATH}/bin"

# GOROOT follows the active asdf-managed toolchain.
local go_bin_path
go_bin_path="$(asdf which go 2>/dev/null)"
if [[ -n "${go_bin_path}" ]]; then
  export GOROOT
  GOROOT="$(dirname "$(dirname "${go_bin_path:A}")")"
fi
