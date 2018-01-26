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
    augroup plaintext
      " autocmd !
      autocmd BufWinEnter <buffer> match Error /\s\+$/
      autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
      autocmd InsertLeave <buffer> match Error /\s\+$/
      autocmd BufWinLeave <buffer> call clearmatches()
    augroup END
  endif
endfun

" Mkdir on save
fun! functions#MkNonExDir(file, buf) abort
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let l:dir=fnamemodify(a:file, ':h')
    if !isdirectory(l:dir)
      call mkdir(l:dir, 'p')
    endif
  endif
endfunction

fun! functions#Help() abort
  if &buftype ==# 'help'
    wincmd T
    nnoremap <buffer> q :q<CR>
  endif
endfunction

" Preserves the state of the editor, executes a command, and restores this state
" http://vimcasts.org/episodes/tidying-whitespace/
fun! functions#Preserve(cmd) abort
  let l:search = @/
  let l:line = line('.')
  let l:col = col('.')
  execute a:cmd
  let @/ = l:search
  call cursor(l:line, l:col)
endfunction

