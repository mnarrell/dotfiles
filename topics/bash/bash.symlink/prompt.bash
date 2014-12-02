# git completion

function __git_prompt() {
  GIT_PS1_SHOWDIRTYSTATE=1
  __git_ps1 " [%s]" | sed 's/ \([+*]\{1,\}\)$/\1/'
}

function bash_prompt() {
  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # bolded colors
  local BK="\[\033[1;30m\]"
  local BR="\[\033[1;31m\]"
  local BG="\[\033[1;32m\]"
  local BY="\[\033[1;33m\]"
  local BB="\[\033[1;34m\]"
  local BM="\[\033[1;35m\]"
  local BC="\[\033[1;36m\]"
  local BW="\[\033[1;37m\]"

  local OFF="\[\033[0;0m\]"

  # reset
  # local RESET="\[\033[0;37m\]"
  local RESET=$OFF

  # PS1="$Y\u@\h$W:$BC\W$M\$(__git_prompt)$RESET $ "
  PS1="$Y\u@\h$W:$ "
}

bash_prompt
unset bash_prompt
