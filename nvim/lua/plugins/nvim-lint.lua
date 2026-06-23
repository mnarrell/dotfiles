-- nvim-lint makes some linters report diagnostics.

return {
  "mfussenegger/nvim-lint",
  event = LazyFile,
  opts = {
    events = { "BufWritePost" },
    linters_by_ft = {
      Dockerfile = { "hadolint" },
      ansible = { "ansible_lint" },
      go = { "revive" },
      json = { "jsonlint" },
      lua = { "luacheck" },
      make = { "checkmake" },
      markdown = { "markdownlint" },
      python = { "ruff" },
      sh = { "shellcheck" },
      sql = { "sqlfluff" },
      terraform = { "tflint" },
      yaml = { "yamllint" },
      zsh = { "zsh" },
    },
    custom_args = {
      luacheck = { "--globals", "vim" },
      -- yamllint auto-discovers `.yamllint{,.yaml,.yml}` from the CWD upward,
      -- so no `-c` is needed here. Overriding `args` would also drop yamllint's
      -- required `--format parsable -` and break diagnostic parsing.
      -- revive = { "-config", vim.env.XDG_CONFIG_HOME .. "/revive.toml" },
    },
  },
  config = function(_, opts)
    local lint = require("lint")
    lint.linters_by_ft = opts.linters_by_ft

    for linter, custom_args in pairs(opts.custom_args or {}) do
      lint.linters[linter].args = custom_args
    end

    vim.api.nvim_create_autocmd(opts.events, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
