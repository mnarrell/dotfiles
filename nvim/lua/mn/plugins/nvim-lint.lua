return {
  "mfussenegger/nvim-lint",
  event = { "BufWritePost", "BufReadPost", "InsertLeave" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      Dockerfile = { "hadolint" },
      lua = { "luacheck" },
      python = { "flake8" },
      yaml = { "yamllint" },
      go = { "revive" },
      sh = { "shellcheck" },
    }
  end,
  init = function()
    local lint = require("lint")
    lint.linters.luacheck.args = {
      "--globals",
      "vim",
    }

    -- lint.linters.revive.args = {
    --   "-config",
    --   "~/.config/golang/revive.toml",
    -- }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
