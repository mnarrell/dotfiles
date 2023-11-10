local lspconfig = require("lspconfig")
local support = require("mn.lsp.support")

--------------------------------------------------------------------------------
-- Lua
require("mn.lsp.lua")

--------------------------------------------------------------------------------
-- Golang
require("mn.lsp.gopls")

--------------------------------------------------------------------------------
-- YAML
require("mn.lsp.yaml")

--------------------------------------------------------------------------------
-- Ansible
lspconfig.ansiblels.setup({
  on_attach = support.on_attach,
  capabilities = support.capabilities(),
})

--------------------------------------------------------------------------------
-- Docker
lspconfig.dockerls.setup({
  capabilities = support.capabilities(),
  on_attach = support.on_attach,
  root_dir = function(fname)
    return lspconfig.util.find_git_ancestor(fname)
  end,
})

--------------------------------------------------------------------------------
-- Shells
lspconfig.bashls.setup({
  on_attach = support.on_attach,
  capabilities = support.capabilities(),
  filetypes = { "sh", "bash" },
})

--------------------------------------------------------------------------------
-- Terraform
lspconfig.terraformls.setup({
  on_attach = support.on_attach,
  capabilities = support.capabilities(),
})

lspconfig.tflint.setup({
  on_attach = support.on_attach,
  capabilities = support.capabilities(),
})

--------------------------------------------------------------------------------
-- Python
lspconfig.pyright.setup({
  on_attach = support.on_attach,
  capabilities = support.capabilities(),
})

lspconfig.jsonls.setup({
  on_attach = support.on_attach,
  capabilities = support.capabilities(),
})

--------------------------------------------------------------------------------
-- Look and feel
-- vim.diagnostic.config({ virtual_text = false })
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

local signs = { Error = "✗ ", Warn = " ", Hint = "󰛩 ", Info = "𝓲 " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
