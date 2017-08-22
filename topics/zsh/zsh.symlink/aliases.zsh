# Load generic aliases
[ -e "${HOME}/.aliases" ] && source "${HOME}/.aliases"

# Need to redefined these aliases at this point as they get trampled by plugins
alias ls="gls --color=tty --quoting-style=literal"
alias ll="ls -lh"
alias la="ls -lah"
