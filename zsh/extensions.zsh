# Base 16 clors because baller
[ -n "$PS1" ] && [ -s ${BASE16_SHELL}/profile_helper.sh ] && eval "$(${BASE16_SHELL}/profile_helper.sh)"

# If you're not FZF, you should be
[ -f "$XDG_CONFIG_HOME/fzf/extensions.zsh" ] && source "$XDG_CONFIG_HOME/fzf/extensions.zsh"
