alias ls="ls -h"
alias la="ls -lah"
alias lsd="ls -l | grep '^d'"
alias ll="ls -lh"
alias la="ls -lah"

alias hosts='sudo -E ${EDITOR} /etc/hosts'
alias sshconfig='${EDITOR} ~/.ssh/config'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print ${1}'"
alias flush="dscacheutil -flushcache"

alias clear="echo 'NO!'"
alias please='sudo $(fc -nl -1)'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias sudo="sudo -E"

alias git='hub'
alias tig="tig --all"
alias tis='\tig status'

alias t="tmux attach || tmux"
alias tk="tmux kill-server"

alias dots="cd ${DOTFILES}"
alias e="${EDITOR} ."

# Synchronization
alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"

alias showfiles="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias sc="find . -name target | xargs rm -r"

if command -v nvim &> /dev/null; then
  alias vim="nvim"
fi

alias dc="docker system prune"
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
alias ke='k exec PODS -it sh'
alias kl='k logs -f PODS'

alias -g IMAGES='$(docker images | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1 \":\" \$2}")'
alias -g CONTAINERS='$(docker ps -a | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'

alias -g PODS='$(  kubectl get pods  | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g DEPLOY='$(kubectl get deploy| fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g RS='$(    kubectl get rs    | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g SVC='$(   kubectl get svc   | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g ING='$(   kubectl get ing   | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
