export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
export PATH=~/bin:/usr/local/bin:$PATH
export EDITOR="vim"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTFILE=${XDG_DATA_HOME}/bash/history
export HISTSIZE=32768
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%m/%d/%y - %H:%M:%S "


bash_prompt() {
  # regular colors
  Y="\\[\\033[0;33m\\]"    # yellow
  W="\\[\\033[0;37m\\]"    # white

  # bolded colors
  BC="\\[\\033[1;36m\\]"

  OFF="\\[\\033[0;0m\\]"

  PS1="$Y\\u@\\h$W: $BC\\W$OFF $ "
}

bash_prompt
unset bash_prompt
