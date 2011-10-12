# PATH
export PATH=/usr/local/bin:$PATH

# I still prefer the older bash-completion-lib to bash-completion
# https://code.google.com/p/bash-completion-lib/
[[ -s /usr/local/etc/bash_completion_lib-1.3.1/bash_completion_lib ]] && source /usr/local/etc/bash_completion_lib-1.3.1/bash_completion_lib

# git completion
[[ -s /usr/local/etc/bash_completion.d/git-completion.bash ]] && source /usr/local/etc/bash_completion.d/git-completion.bash

# https://github.com/joelthelion/autojump
[[ -s /usr/local/etc/autojump.bash ]] && source /usr/local/etc/autojump.bash

# rvm
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

export EDITOR="vim"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# maven defaults
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128M -XX:+UseCompressedOops"
