#!/usr/bin/env zsh

alias -g tf='tofu'
alias -g tfi='tofu init'
alias -g tfp='tofu plan'
alias -g tfa='tofu apply'
alias -g tfd='tofu destroy'
alias -g tfo='tofu output'
alias -g tfs='tofu state'

function tgc() {
  fd -H -I .terra -x rm -rf
  fd -I terraform.tfstate -x rm
}
