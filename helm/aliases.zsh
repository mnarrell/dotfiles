#! /usr/bin/env zsh

alias -g RELEASES='$(helm ls | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
