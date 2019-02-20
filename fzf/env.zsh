#! /usr/bin/env zsh

export FZF_TMUX=1

# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_DEFAULT_COMMAND="fd --type file --follow --exclude .git"
export FZF_DEFAULT_OPTS='--bind ctrl-a:select-all'
