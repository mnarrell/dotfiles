fpath=( ${HOME}/.zsh/functions $fpath )

function show_colors() {
  for code in {000..255}; do print -P -- "$code: %F{$code}Test%f"; done
}

# Imbued tmux alias with session creation
function t() {
  if [[ -z $@ && (-e ./.tmuxp.yaml || -e ./.tmuxp.json) ]]; then
    tmuxp load .
  else
    tmux "$@"
  fi
}

function dots() {
  cd ${DOTFILES} && t
}

# vi: ft=zsh
