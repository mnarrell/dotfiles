# Anything local to this particular machine
[ -e "${HOME}/.localrc" ] && source "${HOME}/.localrc"

# Base 16 colors because baller
[ -n "$PS1" ] && [ -s ${BASE16_SHELL}/profile_helper.sh ] && eval "$(${BASE16_SHELL}/profile_helper.sh)"

# If you're not FZF, you should be
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
