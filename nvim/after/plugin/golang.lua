local g = vim.g

-- Basics
g.go_addtags_transform = "camelcase"
g.go_doc_popup_window = 1
g.go_list_height = 20
g.go_snippet_engine = "ultisnips"
-- g.go_list_type = "quickfix"
-- g.go_updatetime = 400
-- g.go_echo_command_info = 0

-- g.go_debug = {'lsp', 'shell-commands'}
-- g.go_diagnostics_level = 2

-- Disable things in favor of built-in LSP support
g.go_doc_keywordprg_enabled = 0
g.go_code_completion_enabled = 0

-- Formatting
-- g.go_fmt_command = "gopls"
g.go_fmt_fail_silently = 1
g.go_imports_autosave = 1
