#! /usr/bin/env zsh

autoload -Uz vcs_info colors add-zsh-hook

###############################################################################
# VCS Prompt

source ${XDG_CONFIG_HOME}/zsh/zsh-async/async.zsh
# autoload -Uz async && async

() {
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes true
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
}

function -start-async-vcs-info-worker() {
  async_start_worker vcs_info
  async_register_callback vcs_info -async-vcs-info-worker-done
}

function -get-vcs-info-in-worker() {
  cd -q $1
  vcs_info
  print ${vcs_info_msg_0_}
}

function -async-vcs-info-worker-done() {
  local job=$1
  local return_code=$2
  local stdout=$3
  local mode=$6

  if [[ $job == '[async]' ]]; then
    if [[ $return_code -eq 1 ]]; then
      # Corrupt worker output
      return
    elif [[ $return_code -eq 2 || $return_code -eq 3 || $return_code -eq 130 ]]; then
      # 2 = ZLE watcher detected an error on the worker fd.
      # 3 = Response from async_job when worker is missing.
      # 130 = Async worker crashed, this should not happen but it can mean the
      # file descriptor has become corrupt.
      #
      # Restart worker.
      async_stop_worker vcs_info
      -start-async-vcs-info-worker
      return
    fi
  fi

  vcs_info_msg_0_=$stdout
  (( $more )) || zle reset-prompt
}

function -clear-vcs-info-on-chpwd() {
  vcs_info_msg_0_=
}

function -trigger-vcs-info-run-in-worker() {
  async_flush_jobs vcs_info
  async_job vcs_info -get-vcs-info-in-worker $PWD
}

-start-async-vcs-info-worker
add-zsh-hook precmd -trigger-vcs-info-run-in-worker
add-zsh-hook chpwd -clear-vcs-info-on-chpwd


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
# Show Python Virtual Env if configured via direnv.
function show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "%F{242}($(basename $VIRTUAL_ENV))%f"
  fi
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
  "\$(show_virtual_env)"
  "$prompt_newline"
  "%(?.%F{yellow}.%F{red})$%f "
)

setopt prompt_subst
PROMPT="${(j..)prompt_parts}"
SPROMPT="zsh: correct %F{red}'%R'%f to %F{red}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "
