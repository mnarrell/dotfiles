#!/usr/bin/env zsh

alias -g tf='terraform'
alias -g tfi='terraform init'
alias -g tfp='terraform plan'
alias -g tfa='terraform apply'
alias -g tfd='terraform destroy'
alias -g tfo='terraform output'
alias -g tfs='terraform state'

alias -g tg="terragrunt"
alias -g tga="terragrunt run-all"

function tgc() {
  fd -H -I .terra -x rm -rf
  fd -I terraform.tfstate -x rm
}
