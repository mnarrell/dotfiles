return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    -- notify_on_error = false,
    -- notify_no_formatters = false,
    formatters_by_ft = {
      go = { "goimports", "gci", "gofumpt" },
      json = { "jq" },
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      sh = { "shellharden", "shfmt" },
      xml = { "xmllint" },
    },

    format_on_save = function(bufnr)
      local ignored = { "java" }
      if vim.tbl_contains(ignored, vim.bo[bufnr].filetype) then
        return
      end

      return { timeout_ms = 1000, lsp_fallback = true }
    end,

    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
      xmllint = {
        prepend_args = { "--format", "--recover" },
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    -- vim.o.formatexpr = ""
  end,
}
