#!/usr/bin/env zsh

# Docker
alias d='docker'
alias docker_prune="docker system prune -f"

alias -g IMAGES='$(docker images | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1 \":\" \$2}")'
alias -g CONTAINERS='$(docker ps -a | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'

