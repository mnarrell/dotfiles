local M = {}

M.setup = function(lspconfig, custom_attach)
	local sumneko_root = vim.env.HOME .. "/src/lua-language-server"
	local sumneko_bin = sumneko_root .. "/bin/macOS/lua-language-server"
	local luadev = require("lua-dev").setup {
		library = {
			plugins = true,
		},
		lspconfig = {
			on_attach = custom_attach,
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
	lspconfig.sumneko_lua.setup(luadev)
end

return M
