# vi: ft=zsh

function git_prompt() {
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(git_prompt_status)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

PROMPT='%{$fg[green]%}felix%{$fg[white]%}:%c%{$reset_color%}$(git_prompt)%{$fg_bold[yellow]%} $ %{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗%{$fg_bold[cyan]%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}⚑"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[blue]%}▴"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[cyan]%}§"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}…"
