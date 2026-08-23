#! /usr/bin/env zsh

# PATH-mode activation: on every prompt, mise prepends the real tool paths for
# the active pins to $path, so interactive shells get actual binaries rather
# than shims. Runs in the init phase (post-compinit) since it installs a
# precmd/chpwd hook. Non-interactive children never source this phase; they
# fall back to the shims dir that zsh/path.zsh puts on $path.
#
# Guard on $+commands[mise] rather than `command -v` (bash-ism) so a machine
# without mise installed still starts cleanly.
if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi
