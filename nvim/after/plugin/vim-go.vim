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

let g:go_addtags_transform = 'camelcase'
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

let g:go_list_height = 20
let g:go_list_type = 'quickfix'

" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_command='golangci-lint run --print-issued-lines=false'

let g:go_doc_popup_window = 1

let g:go_updatetime = 400

let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_parameters = 1
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


augroup vimgo
  au!
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
  au FileType go nmap gb :<C-u>call <SID>build_go_files()<CR>
  au FileType go nmap gc <Plug>(go-callers)
  au FileType go nmap gf <Plug>(go-referrers)
  au FileType go nmap gi <Plug>(go-implements)
  au FileType go nmap gr <Plug>(go-rename)
  au FileType go nmap tc <Plug>(go-coverage-toggle)
augroup END
