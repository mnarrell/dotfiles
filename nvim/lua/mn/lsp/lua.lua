local lspconfig = require("lspconfig")

local yes, neodev = pcall(require, "neodev")
if yes then
  neodev.setup({
    library = {
      plugins = false,
      -- plugins = {
      --   "telescope.nvim",
      -- },
    },
  })
end

lspconfig.lua_ls.setup({
  on_attach = require("mn.lsp.support").on_attach,
  capabilities = require("mn.lsp.support").capabilities(),
  settings = {
    Lua = {
      -- diagnostics = {
      --   globals = { "vim" },
      -- },
      workspace = {
        preloadFileSize = 50000,
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      completion = {
        keywordSnippet = "Replace",
        callSnippet = "Replace",
      },
      format = {
        enable = false,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          quote_style = "double",
          call_arg_parentheses = "keep",
        },
      },
    },
  },
})
