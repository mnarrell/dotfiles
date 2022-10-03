local sumneko_root = vim.env.HOME .. "/src/lua-language-server"
local sumneko_bin = sumneko_root .. "/bin/lua-language-server"

local on_attach = function(client, bufnr)
	local autocmds = vim.api.nvim_create_augroup("luaAutocmds", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function(args)
			vim.lsp.buf.format { bufnr = args.buf }
		end,
		group = autocmds,
		pattern = "*.lua",
	})

	require("mn.lsp.support").on_attach(client, bufnr)
end

require("neodev").setup {}

require("lspconfig").sumneko_lua.setup {
	cmd = { sumneko_bin, "-E", sumneko_root .. "/main.lua" },
	on_attach = on_attach,
	capabilities = require("mn.lsp.support").capabilities(),
	settings = {
		Lua = {
			workspace = {
				preloadFileSize = 50000,
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
			completion = {
				keywordSnippet = "Replace",
				callSnippet = "Replace",
			},
			format = {
				enable = true,
				defaultConfig = {
					indent_style = "space",
					indent_size = "2",
					quote_style = "double",
					call_arg_parentheses = "keep",
				},
			},
		},
	},
}
