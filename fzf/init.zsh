#! /usr/bin/env zsh

# fzf shell integration (key bindings + fuzzy completion). Requires the fzf
# binary, which fzf/path.zsh puts on PATH during the earlier path phase.
if (( ${+commands[fzf]} )); then
  source <(fzf --zsh)
fi
