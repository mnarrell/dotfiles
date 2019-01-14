alias reload!='exec "$SHELL" -l'

# Suffix aliases (eg. "foo.md" to open Markdown files in "Marked 2.app")
alias -s md='open -a "Marked 2.app"'
alias -s markdown='open -a "Marked 2.app"'

# Handle picky command/arg corrections
alias ./...="nocorrect ./..."
alias zsh="nocorrect zsh"


alias chmod='chmod -v'
alias chown='chown -v'
alias cp='cp -v'
alias mkdir='mkdir -v'
alias mv='mv -v'
alias rm='rm -v'

alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"
