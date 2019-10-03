augroup gitconfig
  au BufRead,BufEnter */git/config set filetype=gitconfig
  au BufRead,BufEnter */git/config.local set filetype=gitconfig
augroup END
