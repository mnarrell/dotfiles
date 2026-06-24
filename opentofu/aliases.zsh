#! /usr/bin/env zsh

alias tf='tofu'
alias tfi='tofu init'
alias tfp='tofu plan'
alias tfa='tofu apply'
alias tfd='tofu destroy'
alias tfo='tofu output'
alias tfs='tofu state'

function tgc() {
  fd -H -I .terra -x rm -rf
  fd -I terraform.tfstate -x rm
}
