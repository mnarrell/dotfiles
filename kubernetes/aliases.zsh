#! /usr/bin/env zsh

if [ $commands[kubectl] ]; then
  function kubectl() {
    source <(command kubectl completion zsh)
    command kubectl "$@"
  }
fi

alias k='kubectl'
alias kp='k get pods -o wide'
alias ks='k get services -o wide'
alias ke='k exec -it PODS bash'
alias kevt="k get events --sort-by='.lastTimestamp'"
alias kl='k logs -f PODS'
alias kdp='k describe pod PODS'
alias kds='k describe service SVC'
alias kcs='k config use-context CTX'
alias kfixcomp='source <(kubectl completion zsh)'

alias -g PODS='$(kfuzz pod)'
alias -g DEPLOY='$(kfuzz deploy)'
alias -g RS='$(kfuzz rs)'
alias -g SVC='$(kfuzz svc)'
alias -g ING='$(kfuzz ing)'
alias -g SECRETS='$(kfuzz secrets)'
alias -g SA='$(kfuzz serviceaccounts)'

alias -g CTX='$(kubectl config get-contexts -o=name | sort -fd | fzf-tmux --reverse --multi --cycle)'

# Fuzzy match a Kubernetes resource
function kfuzz() {
  kubectl get "$1" | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}"
}

# Fuzzy port-forwarding
function kport() {
  local pod=$(kfuzz pod)
  local port=$(kubectl get pod "${pod}" -o json | jq '.spec.containers | .[0].ports | .[0].containerPort')
  echo "Forwarding traffic from localhost:${port} to ${pod}:${port}"
  kubectl port-forward ${pod} ${port}:${port} | bat -l log
}
