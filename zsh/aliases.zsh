alias reload!='exec "$SHELL" -l'

# Suffix aliases (eg. "foo.md" to open Markdown files in "Marked 2.app")
alias -s md='open -a "Marked 2.app"'
alias -s markdown='open -a "Marked 2.app"'

# Handle picky command/arg corrections
alias ./...="nocorrect ./..."
alias zsh="nocorrect zsh"
