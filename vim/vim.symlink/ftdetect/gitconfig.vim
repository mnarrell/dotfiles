augroup gitconfig
  au BufRead,BufEnter gitconfig.symlink set filetype=gitconfig
  au BufRead,BufEnter .gitconfig.local set filetype=gitconfig
augroup END
