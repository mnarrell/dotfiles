#! /usr/bin/env zsh

SYSTEM_PATH=${PATH}
unset PATH

PATH=${HOME}/.local/bin
PATH=${PATH}:${GOBIN}
PATH=${PATH}:${HOME}/.local/share/nvim/mason/bin
PATH=${PATH}:${ASDF_DATA_DIR}/shims
PATH=${PATH}:/opt/homebrew/bin
PATH=${PATH}:/opt/homebrew/sbin
PATH=${PATH}:/opt/homebrew/opt/openssh/bin
PATH=${PATH}:/opt/homebrew/opt/openssl/bin
PATH=${PATH}:/opt/homebrew/opt/postgresql@17/bin
PATH=${PATH}:${XDG_DATA_HOME}/npm/bin
PATH=${PATH}:/opt/homebrew/opt/node/bin
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
