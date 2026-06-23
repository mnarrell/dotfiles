#! /usr/bin/env zsh

# Resolve the active Go toolchain (via asdf) and export its locations. Runs in
# the env phase, before the path phase, so golang/path.zsh can rely on $GOBIN.
local go_bin_path
go_bin_path="$(asdf which go 2>/dev/null)"
if [[ -n "${go_bin_path}" ]]; then
  export GOROOT
  GOROOT="$(dirname "$(dirname "${go_bin_path:A}")")"

  export GOPATH
  GOPATH="$(dirname "${GOROOT:A}")/packages"

  export GOBIN
  GOBIN="$(dirname "${GOROOT:A}")/bin"
fi
