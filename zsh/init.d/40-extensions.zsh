#! /usr/bin/env zsh

# Base 16 colors because baller
[ "$PS1" != "" ] && [ -s "$BASE16_SHELL"/profile_helper.sh ] && source "$BASE16_SHELL/profile_helper.sh"

# direnv hook. PATH is fully built by now (path phase ran before init phase),
# but the absolute path keeps this robust regardless.
eval "$(/opt/homebrew/bin/direnv hook zsh)"

# Note: fzf's shell integration now lives in fzf/init.zsh (loaded by the init
# phase alongside this file), so it is no longer sourced here.
