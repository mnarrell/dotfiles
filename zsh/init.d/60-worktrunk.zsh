#! /usr/bin/env zsh

# worktrunk shell integration.
#
# `wt switch` has to change the *parent* shell's directory, which a binary
# cannot do on its own -- the integration wraps `wt` in a shell function that
# reads a directive file the binary writes, then `builtin cd`s there.
#
# Evaluated at init rather than vendored as a snapshot (the same pattern as the
# direnv hook in 40-extensions.zsh) so the wrapper tracks the installed
# worktrunk version instead of going stale on upgrade.
#
# Guarded so a machine without worktrunk -- or a Brewfile.mini box -- still
# gets a working shell.
if (( $+commands[wt] )); then
  eval "$(wt config shell init zsh)"
fi
