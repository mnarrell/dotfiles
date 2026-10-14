#! /usr/bin/env zsh

# Base 16 colors because baller
[ "$PS1" != "" ] && [ -s "$BASE16_SHELL"/profile_helper.sh ] && source "$BASE16_SHELL/profile_helper.sh"

# direnv hook. PATH is fully built by now (path phase ran before init phase),
# but the absolute path keeps this robust regardless.
eval "$(/opt/homebrew/bin/direnv hook zsh)"

# direnv v2.38.1's generated guard recognizes a top-level function context,
# but zsh 5.9.2 reports bare `shfunc` when invoking precmd_functions.  Keep
# the upstream hook intact apart from accepting that equivalent prompt context,
# so watched files are rechecked on each interactive prompt.
_direnv_hook() {
  setopt localoptions localtraps extendedglob
  if [[ ! -o interactive || $ZSH_SUBSHELL -ne 0 || \
    ( -n $ZSH_EVAL_CONTEXT && $ZSH_EVAL_CONTEXT != shfunc && \
    $ZSH_EVAL_CONTEXT != toplevel(:[a-z]#func|)# ) ]]; then
    return
  fi
  vars="$(/opt/homebrew/bin/direnv export zsh)"
  trap -- '' SIGINT
  eval "$vars"
  trap - SIGINT
}

# Note: fzf's shell integration now lives in fzf/init.zsh (loaded by the init
# phase alongside this file), so it is no longer sourced here.
