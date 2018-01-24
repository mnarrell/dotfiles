if has('autocmd')
  augroup behavior
    autocmd!
    " Save whenever switching windows or leaving vim.
    autocmd FocusLost,WinLeave * :silent! wa
    " Red underlined search results
    autocmd VimEnter * hi Search ctermfg=Red ctermbg=NONE cterm=underline
    " mkdir -p when saving files
    autocmd BufWritePre * :call functions#MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    " Resize splits when VIM is resized
    autocmd VimResized * wincmd =
  augroup END

  if has('nvim')
    augroup Terminal
      autocmd!
      autocmd TermOpen * setlocal nolist nospell noshowmode
    augroup END
  endif

  augroup VimHelp
    autocmd!
    autocmd BufEnter *.txt call functions#Help()
  augroup END
endif
