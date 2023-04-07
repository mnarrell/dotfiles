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

local on_attach = function(client, bufnr)
  local autocmds = vim.api.nvim_create_augroup("luaLsAutocmds", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
      vim.lsp.buf.format({ bufnr = args.buf })
    end,
    group = autocmds,
    pattern = "*.lua",
  })

  require("mn.lsp.support").on_attach(client, bufnr)
end

lspconfig.lua_ls.setup({
  on_attach = on_attach,
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
        --   defaultConfig = {
        --     indent_style = "space",
        --     indent_size = "2",
        --     quote_style = "double",
        --     call_arg_parentheses = "keep",
        --   },
      },
    },
  },
})
