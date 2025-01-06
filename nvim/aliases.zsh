#! /usr/bin/env zsh

function() build_nvim() {
  CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=~/.local" make distclean install
}
