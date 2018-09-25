#!/usr/bin/env zsh

function chunkon() {
  brew services start chunkwm
  brew services start skhd
}
zle -N chunkon
bindkey '^W^U' chunkon

function chunkoff() {
  brew services stop chunkwm
  brew services stop skhd
}
zle -N chunkoff
bindkey '^W^D' chunkoff

function rechunk() {
  brew services restart chunkwm
  brew services restart skhd
}
zle -N rechunk
bindkey '^W^R' rechunk
