#! /usr/bin/env zsh

if [ $+commands[brew] ]; then
  brew() {
    case "$1" in
      cleanup)
        (cd "$(brew --repo)" && git prune && git gc)
        command brew cleanup
        rm -rf "$(brew --cache)"
        ;;
      bump)
        command brew update
        command brew upgrade
        brew cleanup
        ;;
      new)
        command brew update
        command brew outdated
        ;;
      *)
        command brew "$@"
        ;;
    esac
  }
fi
