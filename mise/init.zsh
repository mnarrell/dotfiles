#! /usr/bin/env zsh

# PATH-mode activation: on every prompt, mise prepends the real tool paths for
# the active pins to $path, ahead of the asdf shims zsh/path.zsh already put
# there. That ordering — mise's real paths winning over asdf's shims — is what
# keeps asdf and mise deterministic while tools migrate between them. Runs in
# the init phase (post-compinit) since it installs a precmd/chpwd hook.
#
# Guard on $+commands[mise] rather than `command -v` (bash-ism) so a machine
# without mise installed still starts cleanly.
if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi
