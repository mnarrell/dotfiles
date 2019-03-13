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
endf

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
endf

" Preserves the state of the editor, executes a command, and restores this state
" http://vimcasts.org/episodes/tidying-whitespace/
fun! functions#Preserve(cmd) abort
  let l:search = @/
  let l:line = line('.')
  let l:col = col('.')
  execute a:cmd
  let @/ = l:search
  call cursor(l:line, l:col)
endf

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
endf

" Updates all configured plugins, making a backup first.
fun! functions#UpdatePlugins() abort
  let l:filename='~/.vim/tmp/plugin_snapshot-'.strftime('%Y%m%d-%H%M%S').'.vim'
  echom 'Backing up plugin state to: '.l:filename
  execute 'PlugSnapshot! '.l:filename.' | PlugUpdate | PlugUpgrade'
endf

fun! functions#ToggleQuickFix() abort
  if exists('g:qwindow')
    cclose
    unlet g:qwindow
  else
    " try
    botright copen 20
    let g:qwindow = 1
    " catch
    "   echo 'No Errors found!'
    " endtry
  endif
endf

fun! functions#ToggleLocationList() abort
  if exists('g:lwindow')
    lclose
    unlet g:lwindow
  else
    try
      botright lopen 20
      let g:lwindow = 1
    catch
      echo 'No Errors found!'
    endtry
  endif
endf

fun! functions#Redir(cmd) abort
  for win in range(1, winnr('$'))
    if getwinvar(win, 'scratch')
      execute win . 'windo close'
    endif
  endfor
  if a:cmd =~# '^!'
    execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
  else
    redir => output
    execute a:cmd
    redir END
  endif
  vnew
  let w:scratch = 1
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
  call setline(1, split(output, "\n"))
endf

" Usage:
" 	:Redir hi ............. show the full output of command ':hi' in a scratch window
" 	:Redir !ls -al ........ show the full output of command ':!ls -al' in a scratch window

fun! functions#RestartGocode() abort
  echom 'Gocode killed...'
  silent! !killall gocode
endf

fun! functions#SetPython2() abort
  let b:ale_python_flake8_executable = 'python'
  let b:ale_python_pylint_executable = 'python'
  :ALEToggle
  :ALEToggle
endfun

fun! functions#Base64Decode() abort
  normal! gv"sy
  execute "let output = system('echo -n " . @s . " | base64 -D')"

  for win in range(1, winnr('$'))
    if getwinvar(win, 'scratch')
      execute win . 'windo close'
    endif
  endfor
  botright new
  let w:scratch = 1
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
  " vint: -ProhibitUsingUndeclaredVariable
  call setline(1, split(output, "\n"))
endfun

fun! functions#Rg(...) abort
  let l:output = system('rg --vimgrep '.join(a:000, ' '))
  let l:list = split(l:output, '\n')
  let l:ql = []
  for l:item in l:list
    let sit = split(l:item, ':')
    call add(l:ql, {'filename': sit[0], 'lnum': sit[1], 'col': sit[2], 'text': sit[3]})
  endfor
  call setqflist(l:ql, 'r')
  echo 'Rg results: '.len(l:ql)
endfun
