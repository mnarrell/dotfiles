#! /usr/bin/env zsh

local -a gnu_paths
gnu_path=(
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

local -a gnu_manpath
gnu_manpath=(
  "/opt/homebrew/opt/coreutils/libexec/gnuman"
  "/opt/homebrew/opt/findutils/libexec/gnuman"
  "/opt/homebrew/opt/gnu-which/libexec/gnuman"
  "/opt/homebrew/opt/gnu-tar/libexec/gnuman"
  "/opt/homebrew/opt/make/libexec/gnuman"
  # "/opt/homebrew/opt/gnu-sed/libexec/gnuman"
)

export GNU_BIN=${(j.:.)gnu_path}
export GNU_MAN=${(j.:.)gnu_manpath}
