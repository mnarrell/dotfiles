#! /usr/bin/env zsh

function reset_gocode() {
  gocode drop-cache
  gocode set autobuild true
}
