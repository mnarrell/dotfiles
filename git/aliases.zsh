#! /usr/bin/env bash

# Tig

alias tig="tig --all"
alias tis='\tig status'

alias pr='gh pr view --web'
alias rp='gh repo view --web'

function git_personal_user() {
  git config user.email "$MY_EMAIL"
  git config user.name "$MY_NAME"
}

function eradicate_submodule!() {
  git submodule deinit -f "$1"
  git rm "$1"
  git commit -am "Removed submodule: $1"
  rm -rf ".git/modules/$1"
}

function git_porcelain_submodules() {
  git submodule deinit -f .
  git submodule update --init
}
