#! /usr/bin/env zsh

if [ $commands[helm] ]; then
  function helm() {
    source <(command helm completion zsh)
    command helm "$@"
  }
fi

alias tn='echo $TILLER_NAMESPACE'
