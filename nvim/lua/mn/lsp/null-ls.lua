local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

local M = {}

M.setup = function()
	null_ls.setup(vim.tbl_extend("keep", require("mn.lsp.support").base_config, {
		debug = true,
		diagnostics_format = "[#{c}] #{m} (#{s})",
		should_attach = function(bufnr)
			return not string.find(vim.api.nvim_buf_get_name(bufnr), "BufExplorer")
		end,
		sources = {

			-- Ansible
			null_ls.builtins.diagnostics.ansiblelint.with {
				filetypes = { "yaml", "yaml.ansible" },
			},

			-- Docker
			null_ls.builtins.diagnostics.hadolint,

			-- Go
			-- null_ls.builtins.diagnostics.golangci_lint,
			null_ls.builtins.diagnostics.revive,
			-- null_ls.builtins.diagnostics.staticcheck,
			-- null_ls.builtins.formatting.gofumpt,
			-- null_ls.builtins.formatting.goimports,

			-- Lua
			-- null_ls.builtins.formatting.stylua.with {
			-- 	extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
			-- },
			null_ls.builtins.formatting.stylua.with {
				filetypes = { "lua" },
			},
			-- null_ls.builtins.diagnostics.luacheck.with { extra_args = { "--global vim" } },
			null_ls.builtins.diagnostics.luacheck,

			-- Markdown
			null_ls.builtins.diagnostics.markdownlint,
			null_ls.builtins.code_actions.proselint,

			-- Prettier
			null_ls.builtins.formatting.prettier.with {
				filetypes = { "html", "json", "yaml", "markdown" },
			},

			-- Python
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.isort,
			null_ls.builtins.diagnostics.flake8,
			null_ls.builtins.diagnostics.pylint,

			-- Shell
			null_ls.builtins.formatting.shellharden,
			null_ls.builtins.formatting.shfmt,
			null_ls.builtins.diagnostics.shellcheck,
			null_ls.builtins.code_actions.shellcheck.with {
				filetypes = { "sh", "bash", "zsh" },
			},

			-- SQL
			-- null_ls.builtins.formatting.sqlformat,

			-- VIM
			null_ls.builtins.diagnostics.vint,

			-- YAML
			null_ls.builtins.diagnostics.yamllint,

			--------------------------------------------------------------------------------
			-- Do these work?
			null_ls.builtins.code_actions.gitsigns,

			null_ls.builtins.code_actions.refactoring,
		},
	}))
end

return M
