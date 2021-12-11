local support = require "mn.lsp.support"

local M = {}

M.config = {
	cmd = { "gopls", "--remote=auto" },
	on_attach = support.on_attach,
	capabilities = vim.tbl_extend("force", support.capabilities, {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				},
			},
		},
	}),
	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
	},
}

return M
