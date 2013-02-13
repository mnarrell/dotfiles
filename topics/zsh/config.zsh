autoload colors
colors

# bash style words
autoload -U select-word-style
select-word-style bash

cdpath=( . ~/dev ~/dev/this /usr/local )

# term colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacad

fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt histignorealldups
setopt AUTO_CD
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
