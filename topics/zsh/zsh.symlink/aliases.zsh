# Embellishments
if [ $commands[nvim] ]; then
  alias vim="nvim"
fi

if [ $commands[hub] ]; then
  alias git='hub'
fi

if [ $commands[gls] ]; then
  alias ls="gls --color=tty --quoting-style=literal -h"
fi

alias clear="echo 'NO!'"
alias e="${EDITOR} ."
alias flush="dscacheutil -flushcache"
alias hosts='sudo -E ${EDITOR} /etc/hosts'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print ${1}'"
alias la="ls -lah"
alias la="ls -lah"
alias ll="ls -lh"
alias please='sudo $(fc -nl -1)'
alias sshconfig='${EDITOR} ~/.ssh/config'
alias sudo="sudo -E"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Tig
alias tig="tig --all"
alias tis='\tig status'

# TMUX
alias t="tmux attach -t dots || dots; tmux attach -t dots"
alias tk="tmux kill-server"
alias tls="tmux ls"

# Synchronization
alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"

# OSX stuffs
alias showfiles="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

# Suffix aliases (eg. "foo.md" to open Markdown files in "Marked 2.app")
alias -s md='open -a "Marked 2.app"'
alias -s markdown='open -a "Marked 2.app"'

# Docker
alias dc="docker system prune"
alias -g IMAGES='$(docker images | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1 \":\" \$2}")'
alias -g CONTAINERS='$(docker ps -a | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'

# Here be Kubernetes
alias k='kubectl'
alias kp='k get pods -o wide'
alias ks='k get services -o wide'
alias ke='k exec PODS -it sh'
alias kl='k logs -f PODS'

alias -g PODS='$(  kubectl get pods  | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g DEPLOY='$(kubectl get deploy| fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g RS='$(    kubectl get rs    | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g SVC='$(   kubectl get svc   | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g ING='$(   kubectl get ing   | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'

# Handle picky command/arg corrections
alias ./...="nocorrect ./..."
alias zsh="nocorrect zsh"
