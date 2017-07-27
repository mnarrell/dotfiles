autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "%F{red}!%f"
zstyle ':vcs_info:*' stagedstr "%F{green}+%f"
zstyle ':vcs_info:*' formats " (%b%f%c%u)"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-aheadbehind

precmd() {
  vcs_info
}

function +vi-git-aheadbehind() {
  local ahead behind
  local -a gitstatus

  ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | tr -d ' ')
  (( $ahead )) && gitstatus+=( " %F{green}+${ahead}%f" )

  behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | tr -d ' ')
  (( $behind )) && gitstatus+=( " %F{red}-${behind}%f" )

  hook_com[branch]="%F{blue}${hook_com[branch]}%f${gitstatus}"
}

function +vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
    hook_com[unstaged]+='%F{215}?%f'
  fi
}

setopt prompt_subst
PROMPT="%F{green}%m%f:%F{white}%2c%f\${vcs_info_msg_0_} %F{yellow}$%f "

# vi: ft=zsh

