fpath=( ${HOME}/.zsh/functions $fpath )

if [ $commands[kubectl] ]; then
  function kubectl() {
    source <(command kubectl completion zsh)
    command kubectl "$@"
  }
fi

if [ $commands[helm] ]; then
  function helm() {
    source <(command helm completion zsh)
    command helm "$@"
  }
fi

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

function fbr() {
  local branches branch
  branches=$(git branch) &&
    branch=$(echo "$branches" | fzf +s +m) &&
    git checkout $(echo "$branch" | sed "s/.* //")
}

function git_personal_user() {
  git config user.email $MY_EMAIL
  git config user.name $MY_NAME
}

function git_porcelain_submodules() {
  git submodule deinit -f .
  git submodule update --init
}

# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

# Return the path of the frontmost Finder window
function pfd() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

# Return the current Finder selection
function pfs() {
  osascript 2>/dev/null <<EOF
    set output to ""
    tell application "Finder" to set the_selection to selection
    set item_count to count the_selection
    repeat with item_index from 1 to count the_selection
      if item_index is less than item_count then set the_delimiter to "\n"
      if item_index is item_count then set the_delimiter to ""
      set output to output & ((item item_index of the_selection as alias)'s POSIX path) & the_delimiter
    end repeat
EOF
}

# cd to the current Finder directory
function cdf() {
  cd "$(pfd)"
}

# Open a specified man page in Preview app
function man-preview() {
  man -t "$@" | open -f -a Preview
}

# Execute `ls -lh` after cd-ing to a directory
function auto-ls-after-cd() {
  emulate -L zsh
  # Only in response to a user-initiated `cd`, not indirectly (eg. via another
  # function).
  if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
    ls -lh
  fi
}
add-zsh-hook chpwd auto-ls-after-cd

# Load my dotfile session
function dots() {
  if ! tmux has-session -t dots 2> /dev/null; then
    tmux new-session -d -s dots -c ${DOTFILES} -n public
    tmux new-window -t dots -c ${PRIVATE_DOTFILES} -n private
    tmux new-window -t dots -c ${DOTFILES} -n scratch
    tmux send-keys -t dots:public "vim ." Enter
    tmux send-keys -t dots:private "vim ." Enter
    tmux select-window -t 1
  fi
}

# vi: ft=zsh
