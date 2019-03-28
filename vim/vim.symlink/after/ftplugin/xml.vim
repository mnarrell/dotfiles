" setlocal equalprg=tidy\ -q\ -xml\ -utf8\ -wrap\ 160\ --indent\ auto\ --indent-spaces\ 2\ --vertical-space\ yes\ --tidy-mark\ no\ --indent-cdata\ yes\ --add-xml-decl\ yes\ 2>/dev/null
setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
setlocal foldmethod=indent foldlevel=20

" Quickfix should always be at the bottom
wincmd J

hi def link xmlEndTag Function
