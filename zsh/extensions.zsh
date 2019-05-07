# Base 16 clors because baller
[ -n "$PS1" ] && [ -s ${BASE16_SHELL}/profile_helper.sh ] && eval "$(${BASE16_SHELL}/profile_helper.sh)"

# If you're not FZF, you should be
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -s "/usr/local/etc/grc.zsh" ]] && source /usr/local/etc/grc.zsh
