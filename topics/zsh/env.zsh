export EDITOR="vim"
export M2_HOME=/usr/local/maven
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1g -XX:MaxPermSize=256m -XX:+UseCompressedOops -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.insecure=true" 
export JAVA_HOME=`/usr/libexec/java_home -v '1.7*'`
export KEYS=/Users/matt/dev/this/utilities/pems
export SBT_OPTS=-XX:MaxPermSize=256m
export MANPAGER="less -X"
export PUPPET_HOME="/Users/matt/dev/this/devops/puppet"
export VAGRANT_HOME=/Users/matt/.vagrant.d/
export VBOX_USER_HOME=/Users/matt/.VirtualBox/
export DOCKER_HOST=tcp://127.0.0.1:2375
#
# Enable syntax-highlighting in less.
# brew install source-highlight
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# PATH
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$JAVA_HOME/bin:$HOME/.rvm/bin:$PATH
