local server_configs = {
  "ansiblels",
  "bashls",
  "dockerls",
  "gopls",
  "helm_ls",
  "jsonls",
  "lua_ls",
  "terraformls",
  "tflint",
  "yamlls",
}

-- local server_configs = vim
--   .iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
--   :map(function(file)
--     return vim.fn.fnamemodify(file, ":t:r")
--   end)
--   :totable()

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  once = true,
  callback = function()
    LOG "we in here"

    require("mason-lspconfig").setup {
      ensure_installed = server_configs,
      automatic_enable = true,
      automatic_installation = true,
    }
  end,
})
