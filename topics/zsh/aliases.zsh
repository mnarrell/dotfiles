# Nav
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cdd="cd -"

# http://www.hogbaysoftware.com/products/plaintext
alias text='${EDITOR} ~/Dropbox/PlainText'

# Management
alias dots='${EDITOR} ~/.dotfiles'
alias reload='source ~/.zshrc && echo "sourced ~/.zshrc"'

alias status='${EDITOR} ~/Dropbox/PlainText/status.txt'
alias sshconfig='${EDITOR} ~/.ssh/config'
alias -g ll="ls -lh"
alias -g la="ls -lah"

alias -s xml='${EDITOR}'
alias -s txt='${EDITOR}'
alias -s js='${EDITOR}'

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
alias vu="vagrant up"
alias vd="vagrant destroy"
alias vh="vagrant halt"
alias vs="vagrant ssh"
alias mgr="~/Applications/Manager-7.0/Manager.sh &"

function jc {
  jmx_host=$1
  jmx_port=${2:-6060}
  proxy_host=${3:-aws_west_gateway}
  proxy_port=${4:-8123}

  echo "connecting jconsole to $jmx_host:$jmx_port via SOCKS proxy $proxy_host using local port $proxy_port"
  ssh -f -ND $proxy_port $proxy_host
  jconsole -J-DsocksProxyHost=localhost -J-DsocksProxyPort=${proxy_port} service:jmx:rmi:///jndi/rmi://${jmx_host}:${jmx_port}/jmxrmi
  kill $(ps ax | grep "[s]sh -f -ND $proxy_port" | awk '{print $1}')
}

