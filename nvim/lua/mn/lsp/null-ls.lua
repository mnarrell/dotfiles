local support = require "mn.lsp.support"
local null_ls = require "null-ls"

null_ls.config {
	debug = true,
diagnostics_format = "[#{c}] #{m} (#{s})",
	sources = {

		--------------------------------------------------------------------------------
		-- Formatting
		null_ls.builtins.formatting.prettier.with {
			filetypes = { "html", "json", "yaml", "markdown" },
		},

		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,

		-- null_ls.builtins.formatting.gofumpt,
		-- null_ls.builtins.formatting.goimports,

		null_ls.builtins.formatting.shellharden,
		null_ls.builtins.formatting.shfmt,

		-- null_ls.builtins.formatting.stylua.with {
		-- 	extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
		-- },

		null_ls.builtins.formatting.sqlformat,

		--------------------------------------------------------------------------------
		-- Diagnostics
		null_ls.builtins.diagnostics.ansiblelint,

		null_ls.builtins.diagnostics.codespell,
		-- null_ls.builtins.diagnostics.cspell,
		-- null_ls.builtins.diagnostics.misspell,

		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.pylint,

		null_ls.builtins.diagnostics.hadolint,

		null_ls.builtins.diagnostics.markdownlint,
		-- null_ls.builtins.diagnostics.markdownlint.with {
		-- 	diagnostics_format = "[#{c}] #{m} (#{s})",
		-- },

		null_ls.builtins.diagnostics.shellcheck,

		null_ls.builtins.diagnostics.stylelint,

		null_ls.builtins.diagnostics.vint,

		null_ls.builtins.diagnostics.yamllint,

		null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.diagnostics.staticcheck,

		--------------------------------------------------------------------------------
		-- Code Actions
		null_ls.builtins.code_actions.gitsigns,

		null_ls.builtins.code_actions.proselint,

		null_ls.builtins.code_actions.refactoring,

		null_ls.builtins.code_actions.shellcheck, -- TODO: this might need additional filetypes
	},
}

local M = {}

M.config = support.base_config

return M
