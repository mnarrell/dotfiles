#! /usr/bin/env zsh

if [ $+commands[kubectl] ]; then
  function kubectl() {
    source <(command kubectl completion zsh)
    command kubectl "$@"
  }
fi

if [ $+commands[k3d] ]; then
  function k3d() {
    source <(command k3d completion zsh)
    command k3d "$@"
  }
fi

alias -g k='kubectl'
alias -g kp='k get pods -o wide'
alias -g ks='k get services -o wide'
alias -g ke='k exec -it PODS -- /bin/bash'
alias -g kevt="k get events --sort-by='.lastTimestamp'"
alias -g kl='k logs -f PODS'
alias -g kdp='k describe pod PODS'
alias -g kds='k describe service SVC'
alias -g kc='kubectx'
alias -g kn='kubens'
alias -g kfixcomp='source <(kubectl completion zsh)'
alias -g kge='k get events --sort-by='\''.metadata.creationTimestamp'\'' '

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

# Fuzzy port-forwarding
function kport() {
  local pod=$(kfuzz pod)
  local port=$(kubectl get pod "$pod" -o json | jq '.spec.containers | .[0].ports | .[0].containerPort')
  echo "Forwarding traffic from localhost:${port} to ${pod}:${port}"
  kubectl port-forward "$pod" "$port:$port" | bat -l log
}

function ka() {
  kubectl "$@" --all-namespaces
}

function kerase() {
  kubectl config delete-user "$1"
  kubectl config delete-context "$1"
  kubectl config delete-cluster "$1"
}
