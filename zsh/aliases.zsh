#! /usr/bin/env zsh

alias reload!="exec $SHELL -l"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias chmod="chmod -v"
alias chown="chown -v"
alias clear="echo 'NO!'"
alias cp="cp -v"
alias dots="cd ${DOTFILES}"
alias e="$EDITOR"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print ${1}'"
alias mkdir="mkdir -v"
alias mv="mv -v"
alias rm="rm -v"
alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-synchronize="rsync -avzu --delete --progress -h"
alias rsync-update="rsync -avzu --progress -h"
alias sudo="sudo -E -s "
alias watch="watch --color "
alias kick='NVIM_APPNAME="nvim-kickstart" nvim'

if [ $+commands[eza] ]; then
  alias ls="eza"
  alias ll="eza -lg --git --icons --no-user --time-style long-iso"
  alias la="eza -laag --git --icons --no-user --time-style long-iso"
else
  if [ "$(uname -s)" = "Darwin" ]; then
    if [ $+commands[gls] ]; then
      alias ls="gls --color=tty --quoting-style=literal -h"
    else
      alias ls="ls -FG"
    fi
  else
    alias ls="ls -F --color"
  fi
  alias la="ls -lah"
  alias ll="ls -lh"
fi

# Suffix aliases (eg. "foo.md" to open Markdown files in "Marked 2.app")
alias -s md="open -a 'Marked 2.app'"
alias -s markdown="open -a 'Marked 2.app'"

# Handle picky command/arg corrections
alias ./...="nocorrect ./..."
# alias zsh="nocorrect zsh"

# OSX stuffs
if [ "$(uname -s)" = "Darwin" ]; then
  alias showfiles="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
  alias hidefiles="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"
fi
