# Nav
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cdd="cd -"

# http://www.hogbaysoftware.com/products/plaintext
alias text='mvim ~/Dropbox/PlainText'

# Management
alias dots="mvim ~/.dotfiles"
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/.dotfiles && rake install; cd -'

alias status="mvim ~/Dropbox/PlainText/status.txt"

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

alias hosts='sudo mvim /etc/hosts'

alias grep='grep --color=auto'
alias ann='annotate -p before -m -i -e tests -e fixtures'
alias ssh_beta='ssh -L 2478:localhost:3306 ubuntu@beta.apricotrem.com'
alias this='cd ~/dev/java/this'
alias apricot='cd ~/dev/ruby/apricotrem'
alias ss='svn up && svn st'
alias shelf='cd ~/Library/Preferences/IntelliJIdea10/shelf'

