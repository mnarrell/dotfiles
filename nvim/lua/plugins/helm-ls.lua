-- Helm-specific editing features on top of the helm-ls LSP + tree-sitter setup.
-- Filetype detection and the LSP client are configured elsewhere (filetype.lua,
-- lsp/helm_ls.lua); this plugin is used purely for its editor niceties:
--   * `%` jumps between the start/end of a template block (if/with/range);
--   * highlights the template block under the cursor;
--   * conceals templates with virtual text of their current values;
--   * shows indent/nindent effect hints.
-- Requires the `helm` tree-sitter grammar (installed via treesitter.lua) and the
-- helm_ls binary (installed via Mason). Lazy-loaded on the `helm` filetype.

return {
  "qvalentin/helm-ls.nvim",
  ft = "helm",
  opts = {
    conceal_templates = {
      -- Replace `{{ }}` with the resolved value as virtual text. after/ftplugin/
      -- helm.lua sets conceallevel=2 so wrapped lines stay aligned.
      enabled = true,
    },
    indent_hints = {
      enabled = true,
      only_for_current_line = true,
    },
    action_highlight = {
      enabled = true,
    },
  },
}
