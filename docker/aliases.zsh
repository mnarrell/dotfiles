#!/usr/bin/env zsh

# Docker
alias d='docker'
alias dp="docker system prune -f"
alias dps="docker ps -a"

# Get images
alias di="docker images"

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
alias dri='docker rmi $(docker images -q)'


alias -g IMAGES='$(docker images | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1 \":\" \$2}")'
alias -g CONTAINERS='$(docker ps -a | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
