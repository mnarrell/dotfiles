if has('autocmd')
  augroup behavior
    autocmd!
    " Save whenever switching windows or leaving vim.
    autocmd FocusLost,WinLeave * :silent! wa
    " Strip all trailing whitespace on write
    autocmd BufWritePre * :call functions#Preserve('%s/\v\s+$//e')
    " mkdir -p when saving files
    autocmd BufWritePre * :call functions#MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    " Resize splits when VIM is resized
    autocmd VimResized * wincmd =
    " Quickfix should always be at the bottom
    autocmd FileType qf wincmd J
  augroup END

  if has('nvim')
    augroup Terminal
      autocmd!
      autocmd TermOpen * setlocal nolist nospell noshowmode
      autocmd TermOpen * startinsert
    augroup END
  endif

  augroup VimHelp
    autocmd!
    autocmd BufEnter *.txt call functions#Help()
  augroup END

  augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevel=20
  augroup END
endif
