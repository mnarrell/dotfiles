#!/usr//bin/env bash

for pre_down_hook in topics/*/pre-down; do
  [ -e ${pre_down_hook} ] && echo -e "Running ${pre_down_hook}..." && ${pre_down_hook}
done

echo -e "\nUninstalling dotfiles..."
for link in `ls -la ${HOME} | grep .symlink | awk '{print $9}'`; do
  echo "rm -rf ${HOME}/${link}"
  rm -rf ${HOME}/${link}
done

echo -e "\n"
for post_down_hook in topics/*/post-down; do
  [ -e ${post_down_hook} ] && echo -e "Running ${post_down_hook}..." && ${post_down_hook}
done
