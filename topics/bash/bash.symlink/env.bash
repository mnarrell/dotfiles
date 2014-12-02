export M2_HOME=/usr/local/maven
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1g -XX:MaxPermSize=256m -XX:+UseCompressedOops" 

export PATH=~/bin:/usr/local/bin:$M2:$JMETER_HOME/bin:$JYTHON_HOME/bin:$PATH

# https://code.google.com/p/bash-completion-lib/
if [ -f /usr/local/etc/bash_completion_lib-1.3.1/bash_completion_lib ]; then
  . /usr/local/etc/bash_completion_lib-1.3.1/bash_completion_lib 
fi

# git completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

export EDITOR="vim"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%m/%d/%y - %H:%M:%S "

