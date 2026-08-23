#! /usr/bin/env zsh

# fzf shell integration (key bindings + fuzzy completion). Requires the fzf
# binary, which fzf/path.zsh puts on PATH during the earlier path phase.
#
# Also requires a terminal: everything this sets up is ZLE (Ctrl-R, Ctrl-T,
# Alt-C, fuzzy completion), which does nothing without one. fzf's integration
# snapshots the shell options and restores them with `eval 'options=(... zle
# on ...)'`, and zsh refuses to enable zle with no tty attached -- so in a
# non-interactive-tty shell (`zsh -i -c ...` from a script) it would emit
# "can't change option: zle" twice and set up bindings nothing can use.
if (( ${+commands[fzf]} )) && [[ -t 0 ]]; then
  source <(fzf --zsh)
fi
