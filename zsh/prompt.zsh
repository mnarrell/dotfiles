#! /usr/bin/env zsh

autoload -Uz vcs_info colors

###############################################################################
# VCS Prompt

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats " %F{242}%b%f %c%u%m"
zstyle ':vcs_info:*' stagedstr "%F{green}+%f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{red}!%f" # default 'U'
# zstyle ':vcs_info:*+*:*' debug true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-aheadbehind git-stash
zstyle ':vcs_info:git*:*' actionformats '[%b|%a%m%c%u] ' # default ' (%s)-[%b|%a]%c%u-'

# Identifies untracked files to add to the status message.
function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[staged]+='%F{215}?%f'
  fi
}

# Identifies how many commits this branch is ahead/behind the remote.
function +vi-git-aheadbehind() {
  local ahead behind
  local -a gitstatus

  ahead=$(git rev-list "${hook_com[branch]}"@{upstream}..HEAD 2>/dev/null | wc -l | tr -d ' ')
  (( $ahead )) && gitstatus+=( "%F{green}⇡${ahead}%f" )

  behind=$(git rev-list HEAD.."${hook_com[branch]}"@{upstream} 2>/dev/null | wc -l | tr -d ' ')
  (( $behind )) && gitstatus+=( "%F{red}⇣${behind}%f" )

  if [ ${#gitstatus[@]} -gt 0 ]; then
    hook_com[branch]+=" %F{242}(%f"${(j: :)gitstatus}"%F{242})%f"
  fi
}

# Show count of stashed changes
function +vi-git-stash() {
  local -a stashes

  if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
    stashes=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
    hook_com[misc]+=" %F{242}(${stashes} stashed)%f"
  fi
}

add-zsh-hook precmd vcs_info


###############################################################################
# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}
zle -N zle-keymap-select

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Change the prompt to indicate which mode we're in.
function vi_mode_prompt_info() {
  MODE_INDICATOR=" %F{red}(normal)%f"
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

###############################################################################
# Construct the prompt
if [[ -z $prompt_newline ]]; then
  # This variable needs to be set, usually set by promptinit.
  typeset -g prompt_newline=$'\n%{\r%}'
fi

local -a prompt_parts
prompt_parts=(
  "$prompt_newline"
  "%F{blue}%2c%f"
  "\${vcs_info_msg_0_}"
  "\$(vi_mode_prompt_info)"
  "$prompt_newline"
  "%(?.%F{yellow}.%F{red})$%f "
)

setopt prompt_subst
PROMPT="${(j..)prompt_parts}"
SPROMPT="zsh: correct %F{red}'%R'%f to %F{red}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "
