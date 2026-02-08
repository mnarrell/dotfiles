#! /usr/bin/env zsh

# TMUX
alias tmux="tmux -2 -f ${XDG_CONFIG_HOME}/tmux/tmux.conf"
alias tk="tmux kill-server"
alias tls="tmux ls"

# Load my dotfile session
function t() {
  if ! tmux has-session -t dots 2>/dev/null; then
    tmux new-session -d -s dots -c "$DOTFILES" -n public
    tmux new-window -t dots -c "$PRIVATE_DOTFILES" -n private
    tmux new-window -t dots -c "$HOME/src/homelab" -n homelab
    tmux send-keys -t dots:public "e ." Enter
    tmux send-keys -t dots:private "e ." Enter
    tmux send-keys -t dots:homelab "e ." Enter
    tmux select-window -t 1
  fi
  tmux attach -t dots
}
