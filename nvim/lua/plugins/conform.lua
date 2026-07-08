return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      ["terraform-vars"] = { "tofu_fmt" },
      go = { "goimports", "gofumpt" },
      hcl = { "tofu_fmt" },
      json = { "jq" },
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      sh = { "shellharden", "shfmt" },
      terraform = { "tofu_fmt" },
      xml = { "xmllint" },
      yaml = { "prettier" },
    },

    format_on_save = function(bufnr)
      local ignored = { "java" }
      if vim.tbl_contains(ignored, vim.bo[bufnr].filetype) then
        return
      end

      return { timeout_ms = 3000, lsp_format = "fallback" }
    end,

    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
      tofu_fmt = {
        -- Prefer the OpenTofu binary, but fall back to terraform so pure
        -- Terraform machines (without `tofu` on PATH) still format on save.
        command = function()
          return vim.fn.executable("tofu") == 1 and "tofu" or "terraform"
        end,
        args = { "fmt", "-" },
        stdin = true,
      },
      xmllint = {
        prepend_args = { "--format", "--recover" },
      },
    },
  },
}
