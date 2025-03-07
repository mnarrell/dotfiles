#!/usr/bin/env zsh

#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder in $XDG_CONFIG_HOME/*; do
  if [ -d "$topic_folder" ]; then
    fpath=($topic_folder $fpath)
  fi
done

fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)
