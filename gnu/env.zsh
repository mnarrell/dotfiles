#! /usr/bin/env zsh

local -a gnu_paths
gnu_path=(
  "/usr/local/opt/coreutils/libexec/gnubin"
  "/usr/local/opt/findutils/libexec/gnubin"
  # "/usr/local/opt/gnu-sed/libexec/gnubin"
  "/usr/local/opt/gnu-tar/libexec/gnubin"
  "/usr/local/opt/gnu-getopt/bin"
)

local -a gnu_manpath
gnu_manpath=(
  "/usr/local/opt/coreutils/libexec/gnuman"
  "/usr/local/opt/findutils/libexec/gnuman"
  # "/usr/local/opt/gnu-sed/libexec/gnuman"
  "/usr/local/opt/gnu-tar/libexec/gnuman"
)

export GNU_BIN=${(j.:.)gnu_path}
export GNU_MAN=${(j.:.)gnu_manpath}
