#! /usr/bin/env zsh

# fpath: add a topic folder only when it actually ships autoload/completion
# functions (files beginning with `_`, eg. `_kubectl`), so compinit scans far
# fewer directories. (N-/) follows symlinks (config dirs are symlinked in from
# the dotfiles repo) and matches directories only; (N.) matches regular files
# with no-match-ok. This must run before compinit (it does: completions is a
# pre-compinit phase).
for topic_folder in $XDG_CONFIG_HOME/*(N-/); do
  completions=( $topic_folder/_*(N.) )
  if (( ${#completions} )); then
    fpath=($topic_folder $fpath)
  fi
done
fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)

# Make completion:
# - Case-insensitive.
# - Accept abbreviations after . or _ or - (ie. f.b -> foo.bar).
# - Substring complete (ie. bar -> foobar).
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Colorize completions using default `ls` colors.
zstyle ':completion:*' list-colors ''

# Categorize completion suggestions with headings:
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %F{default}%B%{$__MN[ITALIC_ON]%}--- %d ---%{$__MN[ITALIC_OFF]%}%b%f

bindkey '^w' forward-word
bindkey '^b' backward-word
bindkey '^y' end-of-line
