# Nav
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cdd="cd -"

# Management
alias dots='${EDITOR} ~/.dotfiles'
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/.dotfiles && rake install; cd -'

alias status='${EDITOR} ~/Dropbox/PlainText/status.txt'
alias sshconfig='${EDITOR} ~/.ssh/config'

# List all files colorized in long format, including dot files
shopt -s nocasematch;
if [[ $OSTYPE =~ ^darwin.*$ ]]; then
    alias ls="ls -Gh"
    alias la="ls -Gla"
    alias lsd="ls -Gl | grep '^d'"
elif [[ $OSTYPE =~ ^linux.*$ ]]; then
    alias ls="ls -h --color"
    alias la="ls -lah --color"
    alias lsd="ls -l --color | grep '^d'"
fi
shopt -u nocasematch;

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

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do alias "$method"="lwp-request -m '$method'"; done

alias hosts='sudo ${EDITOR} /etc/hosts'

alias grep='grep --color=auto'

