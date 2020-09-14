" Basics
let g:go_addtags_transform = 'camelcase'
let g:go_doc_popup_window = 1
let g:go_list_height = 20
let g:go_list_type = 'quickfix'
let g:go_snippet_engine = 'ultisnips'
let g:go_updatetime = 400
let g:go_echo_command_info = 0
let g:go_implements_mode = 'gopls'
" let g:go_debug = ['lsp', 'shell-commands']


" Formatting
let g:go_fmt_command = 'gopls'
let g:go_fmt_fail_silently = 1

let g:go_imports_autosave = 1

" Gopls
" https://github.com/golang/tools/blob/master/gopls/doc/settings.md
let g:go_gopls_complete_unimported = 1
let g:go_gopls_gofumpt=v:true
" let g:go_gopls_matcher = 'fuzzy'


" Highlighting
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
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


" call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
