---@type vim.lsp.Config
return {
  cmd = { "tofu-ls", "serve" },
  -- Base filetypes
  filetypes = { "terraform", "terraform-vars" },
  root_markers = { ".terraform", ".git" },
}
