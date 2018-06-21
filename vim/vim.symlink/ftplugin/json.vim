setlocal equalprg=jq\ .

if has('autocmd')
  augroup json
    autocmd!
    autocmd BufWritePre <buffer> :Neoformat
  augroup END
endif
