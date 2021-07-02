local M = {}

M.setup = function(lspconfig, custom_init, custom_attach)
	lspconfig.gopls.setup {
		on_init = custom_init,
		on_attach = custom_attach,

		-- capabilities = updated_capabilities,
		-- root_dir = GoRootDir,

		settings = {
			gopls = {
				codelenses = { test = true },
			},
		},

		flags = {
			debounce_text_changes = 200,
		},
	}
end

return M
