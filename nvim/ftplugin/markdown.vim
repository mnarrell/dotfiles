call functions#plaintext()

setlocal equalprg=prettier\ --stdin-filepath\ '%:p'
setlocal makeprg=open\ %

if has('autocmd')
  augroup markdown
    autocmd BufWritePre *.md :call functions#Preserve('normal gg=G')
  augroup END
endif
