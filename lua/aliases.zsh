#! /usr/bin/env zsh

function generate_lua_tags() {
  find $1 -type f -name "*.lua" -exec "${DOTFILES}/lua/ltags/ltags" -nr -nv {} +
}
