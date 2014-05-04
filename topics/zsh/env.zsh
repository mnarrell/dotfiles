export M2_HOME=/usr/local/maven
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1g -XX:MaxPermSize=256m -XX:+UseCompressedOops -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.insecure=true" 
export JYTHON_HOME=/usr/local/jython
export JAVA_HOME=`/usr/libexec/java_home -v '1.7*'`
export GROOVY_HOME=/usr/local/Cellar/groovy/2.1.1/libexec
export VIM_APP_DIR=/usr/local/Cellar/macvim/HEAD
export KEYS=/Users/matt/dev/this/utilities/pems

# Enable syntax-highlighting in less.
# brew install source-highlight
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "


# PATH
export PATH=~/bin:/usr/local/bin:/usr/bin:/usr/sbin/:bin:/sbin:$JAVA_HOME/bin:$JYTHON_HOME/bin:$HOME/.rvm/bin:$PATH

export EDITOR="vim"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
export AWS_CREDENTIAL_FILE=~/.ec2/account-key
export EC2_PRIVATE_KEY=~/.ec2/mn-keypair.pem
export EC2_CERT=~/.ec2/cert.pem
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
export KITCHEN_HOME="/Users/matt/dev/this/utilities/kitchen"
export VAGRANT_HOME=/Users/matt/.vagrant.d/
export VBOX_USER_HOME=/Users/matt/.VirtualBox/

