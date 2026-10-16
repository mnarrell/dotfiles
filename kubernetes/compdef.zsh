#! /usr/bin/env zsh

# `k` expands to kubecolor before completion in some Zsh completion paths, so
# register kubectl's completion for both the alias and its expansion target.
compdef kubecolor=kubectl
compdef k=kubectl
