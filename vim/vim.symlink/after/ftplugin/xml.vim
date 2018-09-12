setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" setlocal equalprg=tidy\ -q\ -xml\ -utf8\ -wrap\ 160\ --indent\ auto\ --indent-spaces\ 2\ --vertical-space\ yes\ --tidy-mark\ no\ --indent-cdata\ yes\ --add-xml-decl\ yes\ 2>/dev/null

hi def link xmlEndTag Function
