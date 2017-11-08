# Load generic aliases
[ -e "${HOME}/.aliases" ] && source "${HOME}/.aliases"

# Need to redefined these aliases at this point as they get trampled by plugins
alias ls="gls --color=tty --quoting-style=literal"
alias ll="ls -lh"
alias la="ls -lah"

#
# Suffix aliases
# (eg. "foo.md" to open Markdown files in "Marked 2.app")
#
alias -s md='open -a "Marked 2.app"'
alias -s markdown='open -a "Marked 2.app"'


# Here be Kubernetes
alias k='kubectl'
alias kp='k get pods -o wide'
alias ks='k get services -o wide'

alias -g IMAGES='$(docker images | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1 \":\" \$2}")'
alias -g CONTAINERS='$(docker ps -a | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'

# List and select pod name with fzf (https://github.com/junegunn/fzf)
# e.g.
#   kubectl exec -it P sh
#   kubectl delete pod P
alias -g P='$(kubectl get pods | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'

# Like P, global aliases about kubernetes resources
alias -g PODS='$(  kubectl get pods  | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g DEPLOY='$(kubectl get deploy| fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g RS='$(    kubectl get rs    | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g SVC='$(   kubectl get svc   | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g ING='$(   kubectl get ing   | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
