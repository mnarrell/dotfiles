local ok, luadev = pcall(require, "lua-dev")
if not ok then
	P "Unable to load lua-dev"
	return
end

local support = require "mn.lsp.support"

local sumneko_root = vim.env.HOME .. "/src/lua-language-server"
local sumneko_bin = sumneko_root .. "/bin/lua-language-server"

local M = {}

M.config = luadev.setup {
	library = {
		plugins = true,
	},
	lspconfig = vim.tbl_extend("keep", support.base_config, {
		cmd = { sumneko_bin, "-E", sumneko_root .. "/main.lua" },
		settings = {
			Lua = {
				workspace = {
					preloadFileSize = 50000,
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	}),
}

return M
