fun! s:history(earlier) abort
  let l:wininfo = filter(getwininfo(), {i,v -> v.winnr == winnr()})[0]
  let l:cmd = (l:wininfo.loclist ? 'l' : 'c') . (a:earlier ? 'newer' : 'older')
  try
    " silent execute l:cmd
    execute l:cmd
  catch /^Vim\%((\a\+)\)\=:E\%(380\|381\):/
  endtry
endfun

fun! quickfixed#older() abort
  call s:history(0)
endfun

fun! quickfixed#newer() abort
  call s:history(1)
endfun
