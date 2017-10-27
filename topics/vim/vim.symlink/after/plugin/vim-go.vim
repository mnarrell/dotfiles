" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:deoplete#sources#go#gocode_binary = "${GOPATH}/bin/gocode"
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:go_list_type = "quickfix"
let g:go_list_height = 20
let g:go_addtags_transform = "camelcase"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']

let g:go_auto_type_info = 1

let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 0
let g:go_highlight_methods = 1
let g:go_highlight_operators = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_structs = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types = 1

autocmd BufNewFile,BufRead *.go setlocal nolist noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>de <Plug>(go-def-vertical)
  au FileType go nmap <Leader>do <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>tc <Plug>(go-coverage-toggle)
  " au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDeclsDir<cr>
  " au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDeclsDir<cr>
  " au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>

augroup END
