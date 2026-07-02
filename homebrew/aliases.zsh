#! /usr/bin/env zsh

if (($+commands[brew])); then
  brew() {
    case "$1" in
    cleanup)
      (cd "$(brew --repo)" && git prune && git gc)
      command brew cleanup
      rm -rf "$(brew --cache)"
      ;;
    bump)
      command brew update
      command brew upgrade -y
      brew cleanup
      ;;
    new)
      command brew update
      command brew outdated
      ;;
    *)
      command brew "$@"
      ;;
    esac
  }
fi

# Smoke-test that TUIs actually render inside tmux. Catches the class of breakage
# where a `brew upgrade` leaves tmux linked against an incompatible utf8proc /
# ncurses (symptom: nvim and every other TUI show nothing in a pane). Runs an
# isolated tmux server on a throwaway socket, draws a probe, and reads it back.
# Prints "RENDER OK" / "STILL BROKEN"; exit status matches. Run after upgrading.
if (($+commands[tmux])); then
  verify-tmux() {
    emulate -L zsh
    local sock probe rc cmd tmpfile
    sock=$(mktemp -u "${TMPDIR:-/tmp}/verify-tmux.XXXXXX.sock")
    probe="OK_PROBE_$$"
    command tmux -S "$sock" kill-server 2>/dev/null

    if (($+commands[nvim])); then
      cmd="nvim -u NONE +\"call setline(1,['$probe'])\""
    else
      tmpfile=$(mktemp "${TMPDIR:-/tmp}/verify-tmux.XXXXXX")
      print -r -- "$probe" >"$tmpfile"
      cmd="less $tmpfile"
    fi

    command tmux -f /dev/null -S "$sock" new-session -d -x 80 -y 24 "$cmd" 2>/dev/null
    sleep 2
    if command tmux -S "$sock" capture-pane -p 2>/dev/null | grep -q "$probe"; then
      print -P "%F{green}RENDER OK%f — $(command tmux -V) renders TUIs correctly"
      rc=0
    else
      print -P "%F{red}STILL BROKEN%f — $(command tmux -V) is not rendering TUIs"
      rc=1
    fi

    command tmux -S "$sock" kill-server 2>/dev/null
    [[ -n "$tmpfile" ]] && rm -f "$tmpfile"
    return $rc
  }
fi

# Reapply the known-good tmux 3.7 downgrade (re-pours the verified bottle, links,
# pins, re-checks rendering). Use if a future tmux release breaks TUIs again.
# Optional arg: a bottle tag override (e.g. arm64_sequoia) if auto-detect fails.
if (($+commands[brew])); then
  reapply-tmux-fix() {
    command bash "${XDG_CONFIG_HOME:-$HOME/.config}/homebrew/reapply-tmux-3.7.sh" "$@"
  }
fi
