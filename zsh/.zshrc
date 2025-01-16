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
# Initialize the autocompletion framework.
autoload -Uz compinit

# for dump in ${XDG_CACHE_HOME}/zsh/zcompdump(N.mh+24); do
#   print "Reloading Completions"
#   compinit -i -d ${XDG_CACHE_HOME}/zsh/zcompdump;
# done
# compinit -C -d ${XDG_CACHE_HOME}/zsh/zcompdump;

# _comp_files=(${XDG_CACHE_HOME}/zsh/zcompdump(Nm+24))
# if (( $#_comp_files )); then
#   echo "Reloading Completions"
#   compinit -i -C -d ${XDG_CACHE_HOME}/zsh/zcompdump;
# else
#   compinit -C -d ${XDG_CACHE_HOME}/zsh/zcompdump;
# fi

current=${XDG_CACHE_HOME}/zsh/zcompdump-$(date '+%Y%m%d')
if [ -f $current ]; then
  compinit -C -d $current
else
  print "Reloading Completions"
  rm ${XDG_CACHE_HOME}/zsh/zcompdump-* 2>/dev/null
  compinit -i -d $current
fi

# recent=$(find ${XDG_CACHE_HOME}/zsh/zcompdump -mtime -1 2>/dev/null | wc -l)
# if [ $recent -eq 0 ]; then
#   print "Reloading Completions"
#   # If there isnt a recently updated completion file (past 24hrs), create it.
#   compinit -i -d ${XDG_CACHE_HOME}/zsh/zcompdump;
# else
#   # Otherwise load this completion file.
#   compinit -C -d ${XDG_CACHE_HOME}/zsh/zcompdump;
# fi;

################################################################################
# Load ASDF
source /opt/homebrew/opt/asdf/libexec/asdf.sh

################################################################################
# Complete profiling
[ -z ${ZSH_PROFILE+x} ] || zprof
