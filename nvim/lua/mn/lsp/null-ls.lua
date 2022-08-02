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
				filetypes = { "yaml.ansible" },
			},

			-- Docker
			null_ls.builtins.diagnostics.hadolint,

			-- Go
			null_ls.builtins.diagnostics.revive,

			-- Lua
			null_ls.builtins.diagnostics.luacheck.with { extra_args = { "--globals vim" } },

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
			null_ls.builtins.formatting.shfmt.with({
				extra_args = { "-i", "2", "-ci" }
			}),
			null_ls.builtins.code_actions.shellcheck.with {
				filetypes = { "sh", "bash", "zsh" },
			},

			-- YAML
			null_ls.builtins.diagnostics.yamllint,

			--------------------------------------------------------------------------------
			-- Do these work?
			null_ls.builtins.code_actions.gitsigns,
		},
	}))
end

return M
