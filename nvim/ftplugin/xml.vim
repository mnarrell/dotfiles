setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
setlocal foldmethod=indent foldlevel=20

" Quickfix should always be at the bottom
wincmd J

hi def link xmlEndTag Function
