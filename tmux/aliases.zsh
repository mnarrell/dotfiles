#! /usr/bin/env zsh

# TMUX
alias t="tmux attach -t dots"
alias tk="tmux kill-server"
alias tls="tmux ls"


# Load my dotfile session
function dots() {
  if ! tmux has-session -t dots 2> /dev/null; then
    tmux new-session -d -s dots -c ${DOTFILES} -n public
    tmux new-window -t dots -c ${PRIVATE_DOTFILES} -n private
    tmux new-window -t dots -c ${DOTFILES} -n scratch
    tmux send-keys -t dots:public e Enter
    tmux send-keys -t dots:private e Enter
    tmux select-window -t 1
  fi
}
