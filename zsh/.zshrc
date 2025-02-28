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
# All the ZSH files.
config_files=($XDG_CONFIG_HOME/*/*.zsh)

################################################################################
# Load the env files
for f in ${config_files}; do
  [ "${f##*env.zsh*}" ] || source $f
done

################################################################################
# Load Antidote Plugins
# source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
# antidote load
source ${XDG_CONFIG_HOME}/zsh/.zsh_plugins.zsh

################################################################################
# Load everything but the env files.
for f in ${config_files}; do
  [ "${f##*env*}" ] && source $f
done

################################################################################
# Load local configurations, including $PRIVATE_DOTFILES.
[ -f ${XDG_CONFIG_HOME}/zsh/local.zsh ] && . ${XDG_CONFIG_HOME}/zsh/local.zsh

################################################################################
# Prepare for persistent ssh sessions
mkdir -p /tmp/ssh-sockets

################################################################################
# Complete profiling
[ -z ${ZSH_PROFILE+x} ] || zprof
