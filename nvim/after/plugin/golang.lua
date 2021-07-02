local g = vim.g

-- Basics
g.go_addtags_transform = "camelcase"
g.go_doc_popup_window = 1
g.go_list_height = 20
g.go_list_type = "quickfix"
g.go_snippet_engine = "ultisnips"
g.go_updatetime = 400
g.go_echo_command_info = 0
-- g.go_debug = {'lsp', 'shell-commands'}

-- g.go_diagnostics_level = 2

-- Formatting
g.go_fmt_command = "gopls"
g.go_fmt_fail_silently = 1

g.go_imports_autosave = 1

-- Gopls
-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
g.go_gopls_complete_unimported = 1
-- g.go_gopls_gofumpt = true
-- g.go_gopls_matcher = 'fuzzy'

-- Highlighting
g.go_highlight_array_whitespace_error = 1
g.go_highlight_build_constraints = 1
g.go_highlight_chan_whitespace_error = 1
g.go_highlight_diagnostic_errors = 0
g.go_highlight_diagnostic_warnings = 0
g.go_highlight_extra_types = 1
g.go_highlight_fields = 1
g.go_highlight_format_strings = 1
g.go_highlight_function_calls = 1
g.go_highlight_function_parameters = 1
g.go_highlight_functions = 1
g.go_highlight_generate_tags = 1
g.go_highlight_methods = 1
g.go_highlight_operators = 1
g.go_highlight_space_tab_error = 0
g.go_highlight_string_spellcheck = 1
g.go_highlight_structs = 1
g.go_highlight_trailing_whitespace_error = 0
g.go_highlight_types = 1
g.go_highlight_variable_assignments = 1
g.go_highlight_variable_declarations = 1

-- call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
-- end
