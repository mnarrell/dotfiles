#! /usr/bin/env zsh

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
