return {
  "mfussenegger/nvim-lint",
  event = LazyFile,
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      Dockerfile = { "hadolint" },
      ansible = { "ansible_lint" },
      go = { "revive" },
      json = { "jsonlint" },
      lua = { "luacheck" },
      make = { "checkmake" },
      markdown = { "markdownlint" },
      python = { "flake8" },
      sh = { "shellcheck" },
      sql = { "sqlfluff" },
      yaml = { "yamllint" },
      zsh = { "zsh" },
    },
  },
  config = function(_, opts)
    local lint = require("lint")
    lint.linters_by_ft = opts.linters_by_ft

    lint.linters.luacheck.args = { "--globals", "vim" }
    -- lint.linters.revive.args = { "-config", vim.env.XDG_CONFIG_HOME .. "/revive.toml" }

    vim.api.nvim_create_autocmd(opts.events, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
