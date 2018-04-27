setlocal tabstop=2 sts=2 sw=2 expandtab cursorcolumn

if has('autocmd')
  augroup md
    autocmd!
    autocmd BufWritePre * :call Neoformat
  augroup END
endif
