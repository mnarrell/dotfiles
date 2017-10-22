if has('autocmd')
  augroup MyAutocmds
    autocmd!
    autocmd FocusLost,WinLeave * :silent! wa " Save whenever switching windows or leaving vim.
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre * :call functions#MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    autocmd VimResized * wincmd =
  augroup END

  augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
        \ formatoptions+=croq softtabstop=4
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
  augroup END
endif
