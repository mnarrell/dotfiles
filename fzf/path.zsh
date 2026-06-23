#! /usr/bin/env zsh

# Put fzf's bin on PATH (Homebrew keg-only location). Prepended so it is found
# regardless of cross-tool ordering in the path phase.
path=(/opt/homebrew/opt/fzf/bin(N-/) $path)
