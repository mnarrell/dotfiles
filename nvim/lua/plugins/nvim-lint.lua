-- nvim-lint makes some linters report diagnostics.

local yamllint_args = function()
  local root_path = vim.fs.root(0, ".yamllint.yaml")
  if root_path then
    return { "-c", root_path }
  end
  return {}
end

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
      sh = { "shellcheck" },
      sql = { "sqlfluff" },
      yaml = { "yamllint" },
      zsh = { "zsh" },
    },
    custom_args = {
      luacheck = { "--globals", "vim" },
      yamllint = yamllint_args(),
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
