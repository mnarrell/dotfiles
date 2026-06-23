#! /usr/bin/env zsh

# Baseline PATH/MANPATH for the shell. This is the FIRST file sourced in the
# path phase (the loader sources zsh/ before other tool dirs), so it can safely
# reset and rebuild $path from scratch; tool dirs (gnu, golang, fzf, ...) then
# prepend/append their own entries on top of this base.
#
# Dedup (typeset -gU path ...) is declared in .zshrc at global scope, so it
# applies here and to every tool's later additions.
#
# Save the inherited PATH for reference, then replace $path wholesale. A plain
# array assignment (not `unset PATH` first) keeps the -U uniqueness flag set in
# .zshrc intact.
SYSTEM_PATH=${PATH}

# Built in priority order. Optional dirs are guarded with the (N-/) glob
# qualifier: N = no error if absent, - = follow symlinks, / = directory only,
# so a missing tool contributes nothing instead of a dead PATH segment.
# GNU userland and Go's bin are added by gnu/path.zsh and golang/path.zsh.
path=(
  ${HOME}/.local/bin
  ${ASDF_DATA_DIR}/shims(N-/)
  ${HOME}/.local/share/nvim/mason/bin(N-/)
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /opt/homebrew/opt/openssh/bin(N-/)
  /opt/homebrew/opt/openssl/bin(N-/)
  /opt/homebrew/opt/postgresql@17/bin(N-/)
  /Library/TeX/texbin(N-/)
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /usr/sbin
  /bin
  /sbin
)

export PATH
export MANPATH
