#! /usr/bin/env zsh

# Prefer GNU userland over the BSD tools that ship with macOS. These dirs are
# prepended to $path so GNU coreutils/findutils/etc. win over /usr/bin (the
# entire reason for installing gnubin). Manpages are added likewise.
#
# Prepending (rather than appending) is required: the path phase has no
# guaranteed cross-tool ordering, and appending would land GNU *after*
# /usr/bin. `typeset -U path` (set in zsh/path.zsh) dedupes if anything here is
# already present.
local -a gnu_bin
gnu_bin=(
  "/opt/homebrew/opt/coreutils/libexec/gnubin"
  "/opt/homebrew/opt/findutils/libexec/gnubin"
  "/opt/homebrew/opt/gettext/bin"
  "/opt/homebrew/opt/gnu-getopt/bin"
  "/opt/homebrew/opt/gnu-tar/libexec/gnubin"
  "/opt/homebrew/opt/gnu-which/libexec/gnubin"
  "/opt/homebrew/opt/less/bin"
  "/opt/homebrew/opt/make/libexec/gnubin"
  # "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
)

local -a gnu_man
gnu_man=(
  "/opt/homebrew/opt/coreutils/libexec/gnuman"
  "/opt/homebrew/opt/findutils/libexec/gnuman"
  "/opt/homebrew/opt/gnu-which/libexec/gnuman"
  "/opt/homebrew/opt/gnu-tar/libexec/gnuman"
  "/opt/homebrew/opt/make/libexec/gnuman"
  # "/opt/homebrew/opt/gnu-sed/libexec/gnuman"
)

# Keep only dirs that exist, then prepend bins (preserving listed order).
path=(${^gnu_bin}(N-/) $path)

# Prepend GNU manpages. A trailing empty entry (the dangling ':') is deliberate:
# it tells `man` to also search its built-in default path, so non-GNU pages
# still resolve. Build as a string to preserve that trailing colon, since the
# $manpath array form would drop the empty element.
local -a gnu_man_present
gnu_man_present=(${^gnu_man}(N-/))
export MANPATH="${(j.:.)gnu_man_present}:${MANPATH}"
