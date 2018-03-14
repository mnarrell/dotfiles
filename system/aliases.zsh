#! /usr/bin/env zsh

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias clear="echo 'NO!'"
alias flush="dscacheutil -flushcache"
alias hosts='sudo -E ${EDITOR} /etc/hosts'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print ${1}'"
alias please='sudo $(fc -nl -1)'
alias sshconfig='${EDITOR} ~/.ssh/config'
alias sudo="sudo -E"

if [ $commands[exa] ]; then
  alias ls='exa'
  alias ll='exa -lg --git --time-style long-iso'
  alias la='exa -laag --git --time-style long-iso'
else
  if [ "$(uname -s)" = "Darwin" ]; then
    if [ $commands[gls] ]; then
      alias ls="gls --color=tty --quoting-style=literal -h"
    else
      alias ls='ls -FG'
    fi
  else
    alias ls='ls -F --color'
  fi
  alias la="ls -lah"
  alias ll="ls -lh"
fi
