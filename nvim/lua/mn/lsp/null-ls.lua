local ok, null_ls = pcall(require, "null-ls")
if not ok then
	vim.notify("Unable to load null-ls", vim.log.levels.ERROR)
	return
end

null_ls.setup {
	debug = true,
	diagnostics_format = "[#{c}] #{m} (#{s})",
	should_attach = function(bufnr)
		return not string.find(vim.api.nvim_buf_get_name(bufnr), "BufExplorer")
	end,
	on_attach = require("mn.lsp.support").on_attach,
	sources = {

		-- Ansible
		null_ls.builtins.diagnostics.ansiblelint,

		-- Docker
		null_ls.builtins.diagnostics.hadolint,

		-- Go
		null_ls.builtins.diagnostics.revive,

		-- Lua
		null_ls.builtins.diagnostics.luacheck.with { extra_args = { "--globals vim" } },
		null_ls.builtins.formatting.stylua,

		-- Markdown
		null_ls.builtins.diagnostics.markdownlint,
		null_ls.builtins.formatting.markdownlint,
		null_ls.builtins.diagnostics.proselint,
		null_ls.builtins.code_actions.proselint,

		-- Prettier
		null_ls.builtins.formatting.prettier.with {
			filetypes = { "html", "json", "yaml", "markdown" },
		},

		-- Python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.diagnostics.flake8,
		-- null_ls.builtins.diagnostics.pylint,

		-- Shell
		null_ls.builtins.formatting.shellharden,
		null_ls.builtins.formatting.shfmt.with {
			extra_args = { "-i", "2", "-ci" },
		},

		-- YAML
		null_ls.builtins.diagnostics.yamllint,

		--------------------------------------------------------------------------------
		-- Code Actions
		null_ls.builtins.code_actions.gitsigns,

		null_ls.builtins.diagnostics.tidy,
		null_ls.builtins.formatting.tidy,
		null_ls.builtins.diagnostics.zsh,
	},
}
