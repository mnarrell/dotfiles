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
    " Text exiting for prose
    autocmd FileType markdown :call functions#plaintext()
  augroup END

  augroup syntax_help
    autocmd!
    autocmd FileType Dockerfile setlocal nolist
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  augroup END

  augroup linting
    autocmd!
    au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
    au FileType json setlocal equalprg=jq\ .
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
