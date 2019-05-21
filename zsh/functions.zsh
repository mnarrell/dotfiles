function show_colors() {
  for code in {000..255}; do print -P -- "$code: %F{$code}Test%f"; done
}

# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

# Execute `ls -lh` after cd-ing to a directory
function auto-ls-after-cd() {
  emulate -L zsh
  # Only in response to a user-initiated `cd`, not indirectly (eg. via another
  # function).
  if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
    ls -lh
  fi
}
add-zsh-hook chpwd auto-ls-after-cd

# EDITOR shortcuts
function e() {
  if [[ $# -eq 0 ]]; then
    ${EDITOR} .
  else
    ${EDITOR} $1
  fi
}

function fgl() (
    cd /usr/local/Cellar/figlet/*/share/figlet/fonts
    ls *.flf | sort | fzf --no-multi --reverse --preview "figlet -f {} Hello World!"
)

# Show most used shell commands
function most() {
  history 0 | awk '{print $2}' | sort | uniq -c | sort -n -r | head
}

# vi: ft=zsh
