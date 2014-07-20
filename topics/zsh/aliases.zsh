# Nav
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cdd="cd -"

# Management
alias dots='${EDITOR} ~/.dotfiles'
alias reload='source ~/.zshrc && echo "sourced ~/.zshrc"'

alias sshconfig='${EDITOR} ~/.ssh/config'

alias -s xml='${EDITOR}'
alias -s txt='${EDITOR}'
alias -s js='${EDITOR}'
alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "
alias -s ace="unace l"

alias vi="vim"
alias _="sudo"
alias clear="echo 'NO!'"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Start an HTTP server from a directory
alias server="open http://localhost:8080/ && python -m SimpleHTTPServer 8080"

# File size
alias fs="stat -f \"%z bytes\""

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do alias "$method"="lwp-request -m '$method'"; done

alias hosts='sudo -E ${EDITOR} /etc/hosts'
alias grep='grep --color=auto'
alias this='cd ~/dev/this'
alias ss='svn up && svn st'
alias vu="vagrant up --no-provision && vagrant provision"
alias vd="vagrant destroy"
alias vh="vagrant halt"
alias vs="vagrant ssh"
alias mgr="sh ~/Applications/Manager-7.0/Manager.sh > /dev/null &"
alias tcat="tail -f /usr/local/tomcat/logs/catalina.out"
