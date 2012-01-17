export M2_HOME=/usr/local/maven
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1g -XX:MaxPermSize=256m -XX:+UseCompressedOops" 
export MONGODB_HOME=/usr/local/mongo
export JYTHON_HOME=/usr/local/jython

# PATH
export PATH=~/bin:/usr/local/bin:$M2:$PATH:/usr/local/mysql/bin:$MONGODB_HOME/bin:$JYTHON_HOME/bin

# https://code.google.com/p/bash-completion-lib/
if [ -f /usr/local/etc/bash_completion_lib-1.3.1/bash_completion_lib ]; then
  . /usr/local/etc/bash_completion_lib-1.3.1/bash_completion_lib 
fi

# git completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

# https://github.com/joelthelion/autojump
if [[ $OSTYPE =~ ^darwin.*$ ]]; 
then
  if [ -f `brew --prefix`/etc/autojump ]; then
    . `brew --prefix`/etc/autojump
  fi
fi

# rvm
if [ -f ~/.rvm/scripts/rvm ]; then
    . ~/.rvm/scripts/rvm
fi

if [[ $OSTYPE =~ ^darwin.*$ ]]; then
  export EDITOR="mvim"
elif [[ $OSTYPE =~ ^linux.*$ ]]; then
  export EDITOR="vim"
fi

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
