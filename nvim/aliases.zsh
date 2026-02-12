#! /usr/bin/env zsh

function() build_nvim() {
  # CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=~/.local" make distclean install
  make distclean

  make \
    CMAKE_BUILD_TYPE=Release \
    CMAKE_INSTALL_PREFIX="$HOME"/.local \
    -j 8

  rm -rf "$HOME"/.local/share/nvim/runtime

  make install

  nvim --version | head -1
}