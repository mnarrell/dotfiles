#! /usr/bin/env zsh

# Go toolchain vs. workspace. Runs in the env phase, before the path phase, so
# golang/path.zsh can rely on $GOBIN.

# Shared, version-independent workspace. Unconditional: no toolchain lookup is
# needed, so these stay correct however Go itself is installed.
export GOPATH="${XDG_DATA_HOME}/go"
export GOBIN="${GOPATH}/bin"

# GOROOT is deliberately not set here. mise's core:go backend exports it for the
# active toolchain, and GOTOOLCHAIN=auto lets Go fetch whatever a given go.mod
# asks for on top of that -- so hardcoding it here would only ever be wrong.
