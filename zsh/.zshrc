#! /usr/bin/env zsh

[ -z ${ZSH_PROFILE+x} ] || zmodload zsh/zprof

################################################################################
export DOTFILES="$HOME/.dotfiles"
export EDITOR="nvim"
bindkey -v # VIM tho

################################################################################
typeset -A __MN
__MN[ITALIC_ON]=$'\e[3m'
__MN[ITALIC_OFF]=$'\e[23m'

################################################################################
# Load the autocompletion framework.
autoload -Uz compinit

################################################################################
# Load the env files
env_files=($XDG_CONFIG_HOME/*/env.zsh)
for env in ${env_files}; do
  source $env
done

################################################################################
# Load ZSH
zsh_files=($XDG_CONFIG_HOME/zsh/*.zsh)
for f in ${zsh_files}; do
  source $f
done

################################################################################
# Load Antidote Plugins
# source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
# antidote load
source ${XDG_CONFIG_HOME}/zsh/.zsh_plugins.zsh

################################################################################
# Initialize the autocompletion framework.
current=${XDG_CACHE_HOME}/zsh/zcompdump-$(date '+%Y%m%d')
if [ -f $current ]; then
  compinit -C -d $current
else
  print "Reloading Completions"
  rm ${XDG_CACHE_HOME}/zsh/zcompdump-* 2>/dev/null
  compinit -i -d $current
fi

################################################################################
# Load everything else.
remaining=($XDG_CONFIG_HOME/^zsh/(^env).zsh)
for r in ${remaining}; do
  source $r
done

################################################################################
# Prepare for persistent ssh sessions
mkdir -p /tmp/ssh-sockets

################################################################################
# Complete profiling
[ -z ${ZSH_PROFILE+x} ] || zprof
