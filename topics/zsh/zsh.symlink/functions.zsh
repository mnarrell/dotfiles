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

function fo() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# vi: ft=zsh

