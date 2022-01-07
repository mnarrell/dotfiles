local support = require "mn.lsp.support"

local M = {}

M.config = vim.tbl_extend("keep", support.base_config, {
	cmd = { "gopls", "--remote=auto" },
	settings = {
		gopls = {
			usePlaceholders = true,
			completeUnimported = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
})

return M
