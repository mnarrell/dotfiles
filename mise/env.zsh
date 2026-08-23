#! /usr/bin/env zsh

# mise defaults its cache dir to ~/Library/Caches/mise on macOS; pin all three
# dirs under XDG so mise's state lives alongside every other tool in this repo.
export MISE_DATA_DIR="${XDG_DATA_HOME}/mise"
export MISE_CONFIG_DIR="${XDG_CONFIG_HOME}/mise"
export MISE_CACHE_DIR="${XDG_CACHE_HOME}/mise"
