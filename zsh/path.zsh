#! /usr/bin/env zsh

SYSTEM_PATH=${PATH}
unset PATH

PATH=~/.local/bin
PATH=${PATH}:${GOROOT}/bin
PATH=${PATH}:${GOBIN}
PATH=${PATH}:/usr/local/opt/openssl/bin
PATH=${PATH}:/usr/local/opt/python@3.9/libexec/bin
PATH=${PATH}:${XDG_DATA_HOME}/npm/bin
PATH=${PATH}:${XDG_DATA_HOME}/gem/bin
PATH=${PATH}:/usr/local/opt/node/bin
PATH=${PATH}:/usr/local/opt/ruby/bin
PATH=${PATH}:${GNU_BIN}
PATH=${PATH}:/Library/TeX/texbin
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:/usr/local/sbin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/usr/sbin
PATH=${PATH}:/bin
PATH=${PATH}:/sbin

export PATH

export MANPATH=${GNU_MAN}:${MANPATH}
