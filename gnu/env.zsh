#! /usr/bin/env zsh

local -a gnu_paths
gnu_path=(
  "/usr/local/opt/coreutils/libexec/gnubin"
  "/usr/local/opt/findutils/libexec/gnubin"
  "/usr/local/opt/gettext/bin"
  "/usr/local/opt/gnu-getopt/bin"
  "/usr/local/opt/gnu-tar/libexec/gnubin"
  "/usr/local/opt/gnu-which/libexec/gnubin"
  "/usr/local/opt/less/bin"
  "/usr/local/opt/make/libexec/gnubin"
  # "/usr/local/opt/gnu-sed/libexec/gnubin"
)

local -a gnu_manpath
gnu_manpath=(
  "/usr/local/opt/coreutils/libexec/gnuman"
  "/usr/local/opt/findutils/libexec/gnuman"
  "/usr/local/opt/gnu-which/libexec/gnuman"
  "/usr/local/opt/gnu-tar/libexec/gnuman"
  "/usr/local/opt/make/libexec/gnuman"
  # "/usr/local/opt/gnu-sed/libexec/gnuman"
)

export GNU_BIN=${(j.:.)gnu_path}
export GNU_MAN=${(j.:.)gnu_manpath}
