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
alias kl='k logs -f PODS'
alias kdp='k describe pod PODS'
alias kds='k describe service SVC'
alias kcv='k config view | vim -c "set ft=yaml" -'

alias -g PODS='$(  kubectl get pods  | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g DEPLOY='$(kubectl get deploy| fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g RS='$(    kubectl get rs    | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g SVC='$(   kubectl get svc   | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g ING='$(   kubectl get ing   | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'

function kip() {
  local node_ip=$(kubectl cluster-info | grep master | egrep -o '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}')
  local node_ports=$(kubectl get svc -o json SVC | jq -r '.spec.ports[] | "\(.name) \(.nodePort)"')
  if [[ $(echo "${node_ports}" | wc -l) -eq 1 ]]; then
    echo "${node_ports}" \
      | awk -v ip="${node_ip}" '{print "http://" ip ":"$2}' > >(cat) > >(pbcopy)
  else
    echo "${node_ports}" \
      | awk -v OFS='\t' -v ip="${node_ip}" '{print $1, " http://" ip ":"$2}' \
      | fzf-tmux --cycle \
      | awk '{print $2}' > >(cat) > >(pbcopy)
  fi
}

function tns() {
  local ctx=$(kubectl config current-context)
  local cns=$(kubectl config view -o=jsonpath="{.contexts[?(@.name==\"${ctx}\")].context.namespace}")
  echo "TILLER_NAMESPACE=${cns}"
  export TILLER_NAMESPACE=${cns}
}
