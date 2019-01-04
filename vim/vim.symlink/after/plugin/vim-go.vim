" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    " call go#cmd#Build(0)
    " call go#cmd#Install(0)
    GoBuild -i
  endif
endfunction

let g:go_gocode_propose_source = 0
let g:deoplete#sources#go#gocode_binary = $GOPATH. '/bin/gocode'

let g:go_addtags_transform = 'camelcase'
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1

let g:go_list_height = 20
let g:go_list_type = 'quickfix'

" let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['staticcheck']

let g:go_auto_type_info = 1
let g:go_updatetime = 400

let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1


augroup go
  au!

  au BufNewFile,BufRead *.go setlocal nolist noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
  " au BufWritePost *.go silent! GoBuild -i

  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go imap <C-g> <ESC>:<C-u>GoDeclsDir<CR>
  au FileType go nmap <C-g> :GoDeclsDir<CR>

  au FileType go nmap db <Plug>(go-doc-browser)
  au FileType go nmap de <Plug>(go-def-vertical)
  au FileType go nmap tc <Plug>(go-coverage-toggle)
  au FileType go nmap gb :<C-u>call <SID>build_go_files()<CR>
  au FileType go nmap gt  <Plug>(go-test-func)

  au FileType go nmap gf <Plug>(go-referrers)
  au FileType go nmap gr <Plug>(go-rename)
  au FileType go nmap gc <Plug>(go-callers)
  au FileType go nmap gi <Plug>(go-implements)
augroup END
