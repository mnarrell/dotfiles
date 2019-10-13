#! /usr/bin/env zsh

################################################################################
# How Low Can You Go?
export DOTFILES="$HOME/.dotfiles"
export EDITOR='/usr/local/bin/nvim'
bindkey -v # VIM tho

################################################################################
# All the ZSH files.
typeset -U config_files
config_files=($XDG_CONFIG_HOME/*/*.zsh)

################################################################################
# load the env files
for file in ${(M)config_files:#*/env.zsh}; do
  source "$file"
done

################################################################################
# Load Antibody Plugins
source $XDG_DATA_HOME/zsh/plugins

################################################################################
# Load everything but the env files.
for file in ${config_files:#*/env.zsh}; do
  source "$file"
done

################################################################################
# Initialize the autocompletion framework.
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ${XDG_CACHE_HOME}/zsh/zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ${XDG_CACHE_HOME}/zsh/zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i -d ${XDG_CACHE_HOME}/zsh/zcompdump
else
  compinit -C -i -d ${XDG_CACHE_HOME}/zsh/zcompdump
fi

################################################################################
unset config_files updated_at

################################################################################
# Load local configurations, including $PRIVATE_DOTFILES.
[ -f ${XDG_CONFIG_HOME}/zsh/local.zsh ] && . ${XDG_CONFIG_HOME}/zsh/local.zsh
