setlocal equalprg=jq\ .

if has('autocmd')
  augroup md
    autocmd!
    autocmd BufWritePre <buffer> :Neoformat
  augroup END
endif
