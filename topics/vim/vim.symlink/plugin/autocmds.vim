if has('autocmd')
  augroup MyAutocmds
    autocmd!
    autocmd FocusLost,WinLeave * :silent! wa " Save whenever switching windows or leaving vim.
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre,FileWritePre * call functions#AutoMakeDirectory()
    autocmd VimResized * wincmd =

    autocmd BufWritePost *.py Neomake
  augroup END
endif
