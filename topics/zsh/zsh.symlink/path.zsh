SYSTEM_PATH=${PATH}
unset PATH

PATH=~/bin
PATH=${PATH}:${GOPATH}/bin
PATH=${PATH}:${JAVA_HOME}/bin
PATH=${PATH}:${M2_HOME}/bin
PATH=${PATH}:${GNU_BIN}
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:/usr/local/sbin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/usr/sbin
PATH=${PATH}:/bin
PATH=${PATH}:/sbin

export PATH
