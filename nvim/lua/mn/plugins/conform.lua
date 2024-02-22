return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shellharden", "shfmt" },
      python = { "black", "isort" },
      html = { "prettierd" },
      go = { "gci", "gofumpt" },
      -- json = { "prettierd" },
      -- yaml = { "prettierd" },
      markdown = { "prettierd" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
    },
  },
  init = function()
    -- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    vim.o.formatexpr = ""
  end,
}
