#! /usr/bin/env zsh

export MAVEN_OPTS="-Xmx1g -XX:+UseCompressedOops -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.insecure=true"
export M2_HOME="/usr/local/maven"
export JAVA_HOME=`/usr/libexec/java_home`
