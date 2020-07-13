scriptencoding utf-8

setlocal nolist
setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

" setlocal foldmethod=marker
" setlocal foldnestmax=1


" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files() abort
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    GoBuild -i
  endif
endfunction

command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')
command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

imap <C-g> <ESC>:<C-u>GoDeclsDir<CR>
nmap <C-g> :GoDeclsDir<CR>

nmap †  <Plug>(go-test-func)
nmap db <Plug>(go-doc-browser)
nmap de <Plug>(go-def-vertical)
nmap <silent> gb :<C-u>call <SID>build_go_files()<CR>
nmap gc <Plug>(go-callers)
nmap gf <Plug>(go-referrers)
nmap gi <Plug>(go-implements)
nmap gr <Plug>(go-rename)
nmap tc <Plug>(go-coverage-toggle)
