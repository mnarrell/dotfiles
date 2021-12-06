local support = require "mn.lsp.support"

local sumneko_root = vim.env.HOME .. "/src/lua-language-server"
local sumneko_bin = sumneko_root .. "/bin/macOS/lua-language-server"

local M = {}

M.config = require("lua-dev").setup {
	library = {
		plugins = true,
	},
	lspconfig = {
		on_init = support.custom_init,
		on_attach = support.custom_attach,
		capabilities = support.capabilities,
		cmd = { sumneko_bin, "-E", sumneko_root .. "/main.lua" },
		settings = {
			Lua = {
				workspace = {
					preloadFileSize = 50000,
				},
			},
		},
	},
}

return M
