return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shellharden", "shfmt" },
      python = { "black", "isort" },
      hcl = { "terragrunt_hclfmt" },
      html = { "prettierd" },
      go = { "goimports", "gci", "gofumpt" },
      -- json = { "jq" },
      -- yaml = { "prettierd" },
      markdown = { "prettier" },
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
    -- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    vim.o.formatexpr = ""
  end,
}
