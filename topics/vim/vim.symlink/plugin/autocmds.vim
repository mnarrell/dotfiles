if has('autocmd')
  augroup MyAutocmds
    autocmd!
    autocmd FocusLost,WinLeave * :silent! wa " Save whenever switching windows or leaving vim.
    autocmd VimEnter * hi Search ctermfg=Red ctermbg=NONE cterm=underline
    autocmd BufWritePre * :call functions#MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    autocmd VimResized * wincmd =
  augroup END

  augroup editor_stuff
    autocmd!
    autocmd FocusLost   * :set norelativenumber
    autocmd FocusGained * :set relativenumber
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
    " autocmd BufWritePre * call StripWhitespace()
  augroup END

  augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
        \ formatoptions+=croq softtabstop=4
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
  augroup END

  augroup docker
    autocmd!
    autocmd FileType Dockerfile setlocal nolist
  augroup END
endif
