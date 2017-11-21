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


# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select
zle -N edit-command-line

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

function vi_mode_prompt_info() {
  MODE_INDICATOR="%{$fg_bold[red]%}(normal) %{$reset_color%}"
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

function kube_context_info() {
  KUBE_CTX=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")

  if [ -n "$KUBE_CTX" ]; then
      echo "(k8s: ${KUBE_CTX})"
  fi
}

setopt prompt_subst
PROMPT="%F{green}%m%f:%F{white}%2c%f\${vcs_info_msg_0_} %F{yellow}\$(vi_mode_prompt_info)$%f "

RPROMPT="%F{blue}\$(kube_context_info)"

# vi: ft=zsh

