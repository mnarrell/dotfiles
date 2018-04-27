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

" Copies selected markdown and converts it to Confluence style markdown. Puts
" the results in the * register for easy pasting into Confluence.
fun! functions#AsConfluence() abort
  if executable('markdown2confluence')
    let l:tf = tempname() . '.md'
    silent! execute "'<,'> w" l:tf
    silent! execute "let @* = system('markdown2confluence " . l:tf ."')"
    silent! execute 'silent !rm ' . l:tf
  else
    echo 'The markdown2confluence utility was not found on your $PATH'
  endif
endfunction

" Updates all configured plugins, making a backup first.
fun! functions#UpdatePlugins() abort
  let l:filename='~/.vim/tmp/plugin_snapshot-'.strftime('%Y%m%d-%H%M%S').'.vim'
  echom 'Backing up plugin state to: '.l:filename
  execute 'PlugSnapshot! '.l:filename.' | PlugUpdate | PlugUpgrade'
endf
