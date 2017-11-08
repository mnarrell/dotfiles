fpath=( ${HOME}/.zsh/functions $fpath )

function show_colors() {
  for code in {000..255}; do print -P -- "$code: %F{$code}Test%f"; done
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

function git_personal_user() {
  git config user.email $MY_EMAIL
  git config user.name $MY_NAME
}

function git_porcelain_submodules() {
  git submodule deinit -f .
  git submodule update --init
}

# vi: ft=zsh

