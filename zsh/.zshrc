#! /usr/bin/env zsh

[ -z ${ZSH_PROFILE+x} ] || zmodload zsh/zprof

################################################################################
# Globals needed before any phase runs.
export DOTFILES="$HOME/.dotfiles"
export EDITOR="nvim"
bindkey -v # VIM tho

typeset -A __MN
__MN[ITALIC_ON]=$'\e[3m'
__MN[ITALIC_OFF]=$'\e[23m'

# Keep PATH/MANPATH/FPATH duplicate-free. MUST be declared here at global scope
# (with -g): the phase files are sourced inside _mn_load_phase(), and a bare
# `typeset` there would create a *function-local* path, silently discarding
# every tool's PATH contribution when the function returns.
typeset -gU path PATH fpath FPATH manpath MANPATH

autoload -Uz compinit

################################################################################
# Machine-local / secret config (symlinked in from the sibling
# ~/.private_dotfiles repo; absent on a fresh clone). Sourced first so its
# exports are visible to every phase below. It does not follow the phase
# convention because it lives in another repo.
[ -r ${XDG_CONFIG_HOME}/zsh/local.zsh ] && source ${XDG_CONFIG_HOME}/zsh/local.zsh

################################################################################
# Phase loader.
#
# Each tool under $XDG_CONFIG_HOME contributes to startup by dropping a file
# named for the phase it belongs to. .zshrc sources every <tool>/<phase>.zsh in
# directory order, one phase at a time, so ordering is explicit and a tool never
# needs to touch this file. Phases (in order):
#
#   env.zsh          exports only (no PATH edits, no commands)
#   path.zsh         add to $path / $manpath / $fpath
#   completions.zsh  fpath additions, zstyles, autoloads  (pre-compinit)
#   --- compinit runs here ---
#   compdef.zsh      `compdef ...`, `source <(tool completion)`  (post-compinit)
#   init.zsh         interactive setup: hooks, prompt, keybinds, options
#   aliases.zsh      aliases and shell functions
#
# Within a phase, the shell's own dir (zsh/) is always sourced FIRST so it can
# lay down a baseline that other tools layer onto. The critical case: the path
# phase — zsh/path.zsh resets and rebuilds $path from scratch, so it must run
# before any tool that prepends/appends its own bin dir.
#
# (N) keeps a phase with no files from erroring. Symlinked tool dirs (this repo
# deploys via symlinks) are followed because */ matches them.
#
# IMPORTANT: this function must NOT set any options (eg. `local_options`,
# `extendedglob`): the sourced phase files include zsh/init.d/10-setopts.zsh,
# whose `setopt` calls would be reverted on return if local_options were active.
# zsh/ is therefore selected by an explicit prefix test rather than a `^zsh`
# negation glob (which would have required extendedglob).
function _mn_load_phase() {
  local f
  local zshfile=$XDG_CONFIG_HOME/zsh/$1.zsh
  # zsh/ baseline first (if present).
  [[ -r $zshfile ]] && source $zshfile
  # Then every other tool dir in name order, skipping zsh/ (already done).
  for f in $XDG_CONFIG_HOME/*/$1.zsh(N); do
    [[ $f == $zshfile ]] && continue
    source $f
  done
}

################################################################################
# Pre-compinit phases.
for phase in env path completions; do
  _mn_load_phase $phase
done

################################################################################
# Plugins (antidote-generated static file).
# source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
# antidote load
source ${XDG_CONFIG_HOME}/zsh/.zsh_plugins.zsh

################################################################################
# Initialize the autocompletion framework.
# Dump filename is keyed to the zsh version (stable across days) so we don't
# force a full rebuild every calendar day. Do the expensive security-checked
# rebuild only when the dump is missing/empty or older than 24h; otherwise take
# the fast path (-C skips the per-file security check). The glob qualifier
# (N.mh+24) yields the dump only when it exists AND was modified >24h ago;
# assigning to an array forces filename generation (which `[[ ]]` does not do).
zcompdump=${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}
zcompdump_stale=(${zcompdump}(N.mh+24))
if ((${#zcompdump_stale})) || [[ ! -s ${zcompdump} ]]; then
  print "Reloading Completions"
  compinit -i -d ${zcompdump}
  # compinit only rewrites the dump when its contents change, so an unchanged
  # rebuild leaves the old mtime and we'd re-run this slow path every launch.
  # Touch it to reset the 24h clock regardless.
  touch ${zcompdump}
else
  compinit -C -d ${zcompdump}
fi
unset zcompdump_stale

# Compile the dump to bytecode so future startups load it without re-parsing
# the (~60KB) text. Rebuild the .zwc in the background only when it is missing
# or older than the dump, so it never blocks the prompt.
if [[ ! -s ${zcompdump}.zwc || ${zcompdump} -nt ${zcompdump}.zwc ]]; then
  { zcompile -R -- ${zcompdump}.zwc ${zcompdump}; } &|
fi

################################################################################
# Post-compinit phases.
for phase in compdef init aliases; do
  _mn_load_phase $phase
done

unfunction _mn_load_phase

################################################################################
# Prepare for persistent ssh sessions
mkdir -p /tmp/ssh-sockets

################################################################################
# Complete profiling
[ -z ${ZSH_PROFILE+x} ] || zprof
