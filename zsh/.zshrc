#! /usr/bin/env zsh

[ -z ${ZSH_PROFILE+x} ] || zmodload zsh/zprof

################################################################################
export DOTFILES="$HOME/.dotfiles"
export EDITOR="nvim"
bindkey -v # VIM tho

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
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

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
# Initialize the autocompletion framework.
autoload -Uz compinit

recent=$(find ${XDG_CACHE_HOME}/zsh/zcompdump -mtime -1 2>/dev/null | wc -l)
if [ $recent -eq 0 ]; then
  # If there isnt a recently updated completion file (past 24hrs), create it.
  compinit -i -d ${XDG_CACHE_HOME}/zsh/zcompdump;
else
  # Otherwise load this completion file.
  compinit -C -d ${XDG_CACHE_HOME}/zsh/zcompdump;
fi;

[ -z ${ZSH_PROFILE+x} ] || zprof

source /opt/homebrew/opt/asdf/libexec/asdf.sh
