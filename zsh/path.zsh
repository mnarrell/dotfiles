#! /usr/bin/env zsh

SYSTEM_PATH=${PATH}
unset PATH

PATH=~/.local/bin
PATH=${PATH}:${GOROOT}/bin
PATH=${PATH}:${GOBIN}
PATH=${PATH}:${HOME}/.local/share/nvim/mason/bin
PATH=${PATH}:/opt/homebrew/bin
PATH=${PATH}:/opt/homebrew/sbin
PATH=${PATH}:/opt/homebrew/opt/openssh/bin
PATH=${PATH}:/opt/homebrew/opt/openssl/bin
PATH=${PATH}:/opt/homebrew/opt/python@3/libexec/bin
# PATH=${PATH}:/opt/homebrew/opt/postgresql@15/bin
PATH=${PATH}:${XDG_DATA_HOME}/npm/bin
PATH=${PATH}:${XDG_DATA_HOME}/gem/bin
PATH=${PATH}:/opt/homebrew/opt/java/bin
PATH=${PATH}:/opt/homebrew/opt/node/bin
PATH=${PATH}:/opt/homebrew/opt/ruby/bin
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
