#! /usr/bin/env zsh

# zoxide init installs shell hooks (a cd wrapper that tracks visited
# directories), so it belongs in the init phase (post-compinit), same as
# mise's activate hook above.
#
# Guard on $+commands[zoxide] rather than `command -v` (bash-ism) so a machine
# without zoxide installed still starts cleanly.
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi
