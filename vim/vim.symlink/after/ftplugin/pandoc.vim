call functions#plaintext()

if has('autocmd')
  augroup pandoc
    autocmd!
    autocmd BufWritePre <buffer> :Neoformat
  augroup END
endif
