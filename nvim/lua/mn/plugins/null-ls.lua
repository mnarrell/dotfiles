return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = false,
    event = "BufReadPre",
    opts = function()
      -- local null_ls = require("null-ls")

      return {
        -- debug = false,
        diagnostics_format = "[#{c}] #{m} (#{s})",
        on_attach = require("mn.lsp.support").on_attach,
        sources = {

          -- Docker
          -- null_ls.builtins.diagnostics.hadolint,

          -- Lua
          -- null_ls.builtins.diagnostics.luacheck.with({ extra_args = { "--globals vim" } }),
          -- null_ls.builtins.formatting.stylua,

          -- -- Prettier
          -- null_ls.builtins.formatting.prettierd.with({
          --   filetypes = { "html", "json", "yaml", "markdown" },
          -- }),

          -- Python
          -- null_ls.builtins.formatting.black,
          -- null_ls.builtins.formatting.isort,
          -- null_ls.builtins.diagnostics.flake8,

          -- -- Shell
          -- null_ls.builtins.formatting.shellharden,
          -- null_ls.builtins.formatting.shfmt.with({
          --   extra_args = { "-i", "2", "-ci" },
          -- }),

          -- YAML
          -- null_ls.builtins.diagnostics.yamllint,

          --------------------------------------------------------------------------------
          -- Code Actions
          -- null_ls.builtins.code_actions.gitsigns,
        },
      }
    end,
  },
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   event = "BufReadPre",
  --   dependencies = {
  --     "jose-elias-alvarez/null-ls.nvim",
  --     "williamboman/mason-lspconfig.nvim",
  --   },
  --   opts = {
  --     ensure_installed = nil,
  --     automatic_installation = true,
  --     automatic_setup = false,
  --   },
  -- },
}
