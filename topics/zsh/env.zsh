export M2_HOME=/usr/local/maven
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1g -XX:MaxPermSize=256m -XX:+UseCompressedOops" 
export JYTHON_HOME=/usr/local/jython
export JMETER_HOME=/usr/local/jmeter
export JAVA_HOME=`/usr/libexec/java_home`
export GROOVY_HOME=/usr/local/Cellar/groovy/2.0.1/libexec
export VIM_APP_DIR=/usr/local/Cellar/macvim/HEAD

cdpath=( ~/dev ~/dev/this /usr/local)

bindkey -v
bindkey -M vicmd '?' history-incremental-search-backward

# PATH
export PATH=~/bin:/usr/local/bin:$M2:$JMETER_HOME/bin:$JYTHON_HOME/bin:$PATH

export EDITOR="mvim"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
export AWS_CREDENTIAL_FILE=~/.ec2/account-key
export EC2_PRIVATE_KEY=~/.ec2/mn-keypair.pem
export EC2_CERT=~/.ec2/cert.pem
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
export KITCHEN_HOME="/Users/matt/dev/this/utilities/kitchen"
