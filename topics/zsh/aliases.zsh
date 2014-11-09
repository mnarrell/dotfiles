# Nav
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cdd="cd -"

# Management
alias dots='cd ~/.dotfiles'
alias reload='source ~/.zshrc && echo "sourced ~/.zshrc"'

alias vi="vim"
alias grep='grep --color=auto'
alias hosts='sudo -E ${EDITOR} /etc/hosts'
alias sshconfig='${EDITOR} ~/.ssh/config'
alias clear="echo 'NO!'"
alias please='sudo $(fc -nl -1)'

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

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do alias "$method"="lwp-request -m '$method'"; done

# Vagrant
alias vu="vagrant up --no-provision && vagrant provision"
alias vd="vagrant destroy"
alias vh="vagrant halt"
alias vs="vagrant ssh"
