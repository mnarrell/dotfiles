# Base 16 clors because baller
[ "$PS1" != "" ] && [ -s "$BASE16_SHELL"/profile_helper.sh ] && source "$BASE16_SHELL/profile_helper.sh"

# If you're not FZF, you should be
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

eval "$(/opt/homebrew/bin/direnv hook zsh)"
