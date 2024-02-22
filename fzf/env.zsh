#! /usr/bin/env zsh

# export FZF_TMUX=1

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-messages --no-ignore-vcs'
# export FZF_DEFAULT_COMMAND="fd --type file --hidden --follow --exclude '.git/*'"

export FZF_DEFAULT_OPTS='--bind ctrl-a:select-all'
# export FZF_CTRL_R_OPTS="--reverse"
export FZF_TMUX_OPTS="-p"
