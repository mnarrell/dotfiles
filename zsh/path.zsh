SYSTEM_PATH=${PATH}
unset PATH

PATH=~/bin
PATH=${PATH}:${GOROOT}/bin
PATH=${PATH}:${JAVA_HOME}/bin
# PATH=${PATH}:/usr/local/opt/openssl/bin
# PATH=${PATH}:/usr/local/lib/ruby/gems/2.6.0/bin
PATH=${PATH}:/usr/local/opt/node@10/bin
PATH=${PATH}:/usr/local/opt/ruby/bin
PATH=${PATH}:${GNU_BIN}
PATH=${PATH}:/usr/local/opt/gettext/bin
PATH=${PATH}:/Library/TeX/texbin
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:/usr/local/sbin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/usr/sbin
PATH=${PATH}:/bin
PATH=${PATH}:/sbin

export PATH

export MANPATH=${GNU_MAN}:${MANPATH}
