" Switch to plaintext mode with: call functions#plaintext()
fun! functions#plaintext() abort
  setlocal nolist
  setlocal spell
  setlocal textwidth=0
  setlocal wrap
  setlocal wrapmargin=0

  nnoremap <buffer> j gj
  nnoremap <buffer> k gk

  " Ideally would keep 'list' set, and restrict 'listchars' to just show
  " whitespace errors, but 'listchars' is global and I don't want to go through
  " the hassle of saving and restoring.
  if has('autocmd')
    autocmd BufWinEnter <buffer> match Error /\s\+$/
    autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
    autocmd InsertLeave <buffer> match Error /\s\+$/
    autocmd BufWinLeave <buffer> call clearmatches()
  endif
endfun

" Mkdir on save
fun! functions#AutoMakeDirectory()
  let s:directory = expand("<afile>:p:h")
  if !isdirectory(s:directory)
    call mkdir(s:directory, "p")
  endif
endfun

" Format JSON with jq
fun! functions#PrettyJSON()
  %!jq .
  set filetype=json
endfun
nmap =j :call PrettyJSON()<CR>
let g:vim_json_syntax_conceal = 0

" Format XML
fun! functions#DoPrettyXML()
  let l:origft = &ft
  set ft=
  silent %!xmllint --format -
  1
  exe "set ft=" . l:origft
endfun
nmap =x :call DoPrettyXML()<CR>

