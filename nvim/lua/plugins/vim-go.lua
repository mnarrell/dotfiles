return {
  "fatih/vim-go",
  build = ":GoUpdateBinaries",
  -- enabled = false,
  ft = "go",
  init = function()
    local g = vim.g

    g.go_gopls_enabled = 0

    -- Basics
    g.go_addtags_transform = "camelcase"
    g.go_doc_popup_window = 1
    g.go_list_height = 20
    g.go_fmt_autosave = 0

    -- Disable things in favor of built-in LSP support
    g.go_doc_keywordprg_enabled = 0
    g.go_code_completion_enabled = 0

    -- Formatting
    -- g.go_fmt_command = "gopls"
    g.go_fmt_fail_silently = 1
    g.go_imports_autosave = 1
  end,
}
