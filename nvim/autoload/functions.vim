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

fun! functions#ToggleQuickFix() abort
  if exists('g:qwindow')
    cclose
    unlet g:qwindow
  else
    try
      botright copen 20
      let g:qwindow = 1
    catch
      "   echo 'No Errors found!'
    endtry
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

fun! functions#Base64Decode() abort
  normal! gv"sy
  execute "let output = system('echo -n " . @s . " | base64 -d')"

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

function! functions#ClearRegisters() abort
  let l:regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
  let l:i=0
  while (l:i<strlen(l:regs))
    exec 'let @'.l:regs[l:i].'=""'
    let l:i=l:i+1
  endwhile
endfunction


function! functions#SaveAndExec() abort
  :silent! write
  if &filetype == 'vim'
    :source %
  elseif &filetype == 'lua'
    :luafile %
  endif
  return
endfunction

