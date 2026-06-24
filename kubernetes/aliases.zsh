#! /usr/bin/env zsh

alias k='kubectl'
alias kp='k get pods -o wide'
alias ks='k get services -o wide'
alias ke='k exec -it PODS -- /bin/bash'
alias kevt="k get events --sort-by='.lastTimestamp'"
alias kl='k logs -f PODS'
alias kdp='k describe pod PODS'
alias kds='k describe service SVC'
alias kc='kubectx'
alias kn='kubens'
alias kge='k get events --sort-by='\''.metadata.creationTimestamp'\'' '

alias -g PODS='$(kfuzz pod)'
alias -g DEPLOY='$(kfuzz deploy)'
alias -g RS='$(kfuzz rs)'
alias -g SVC='$(kfuzz svc)'
alias -g ING='$(kfuzz ing)'
alias -g SECRETS='$(kfuzz secrets)'
alias -g SA='$(kfuzz serviceaccounts)'

# Fuzzy match a Kubernetes resource
function kfuzz() {
  kubectl get "$1" | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}"
}

function ka() {
  kubectl "$@" --all-namespaces
}

function kerase() {
  kubectl config delete-user "$1"
  kubectl config delete-context "$1"
  kubectl config delete-cluster "$1"
}
