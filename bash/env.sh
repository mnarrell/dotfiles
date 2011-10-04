# PATH
export PATH=/usr/local/bin:$PATH

# https://code.google.com/p/bash-completion-lib/
if [ -f /usr/local/etc/bash_completion_lib-1.3.1/bash_completion_lib ]; then
  . /usr/local/etc/bash_completion_lib-1.3.1/bash_completion_lib 
fi

# git completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

# https://github.com/joelthelion/autojump
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

# rvm
if [ -f ~/.rvm/scripts/rvm ]; then
    . ~/.rvm/scripts/rvm
fi

export EDITOR="vim"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# maven defaults
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128M -XX:+UseCompressedOops"
