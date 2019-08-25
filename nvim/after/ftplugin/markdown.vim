call functions#plaintext()

setlocal equalprg=prettier\ --stdin\ --stdin-filepath\ '%:p'
setlocal makeprg=open\ %
