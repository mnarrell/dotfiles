" vint: -ProhibitAutocmdWithNoGroup

scriptencoding utf-8

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files() abort
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    GoBuild -i
  endif
endfunction

au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

au FileType go imap <C-g> <ESC>:<C-u>GoDeclsDir<CR>
au FileType go nmap <C-g> :GoDeclsDir<CR>

" Option-T
au FileType go nmap †  <Plug>(go-test-func)
au FileType go nmap db <Plug>(go-doc-browser)
au FileType go nmap de <Plug>(go-def-vertical)
au FileType go nmap <silent> gb :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap gc <Plug>(go-callers)
au FileType go nmap gf <Plug>(go-referrers)
au FileType go nmap gi <Plug>(go-implements)
au FileType go nmap gr <Plug>(go-rename)
au FileType go nmap tc <Plug>(go-coverage-toggle)
