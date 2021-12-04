local signs = { Error = "✗ ", Warn = " ", Hint = " ", Information = "𝓲 " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
})

vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable = false})]]

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local custom_init = function(client)
	client.config.flags = client.config.flags or {}
	client.config.flags.allow_incremental_sync = true
end

local custom_attach = function(client, bufnr)
	print(string.format([['%s', language server started]], client.name))

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "<Leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<Leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<Leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<Leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<Leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- buf_set_keymap('n', '<Leader>ls', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	-- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	-- buf_set_keymap('n', 'gq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

	-- -- Set some keybinds conditional on server capabilities
	-- if client.resolved_capabilities.document_formatting then
	buf_set_keymap("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	-- elseif client.resolved_capabilities.document_range_formatting then
	--   buf_set_keymap('n', '<Leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	-- end
end

local lspconfig = require "lspconfig"

require("mn.lsp.lua").setup(lspconfig, custom_attach)

lspconfig.gopls.setup {
	on_init = custom_init,
	on_attach = custom_attach,
	capabilities = capabilities,
}

lspconfig.dockerls.setup {
	on_attach = custom_attach,
	root_dir = function(fname)
		return lspconfig.util.find_git_ancestor(fname)
	end,
}

lspconfig.jsonls.setup {
	on_attach = custom_attach,
	capabilities = capabilities,
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
			end,
		},
	},
}

lspconfig.bashls.setup {
	on_attach = custom_attach,
	capabilities = capabilities,
	filetypes = { "sh", "zsh", "bash" },
}

lspconfig.pyright.setup {
	on_attach = custom_attach,
	capabilities = capabilities,
	settings = {
		python = {
			formatting = {
				provider = "yapf",
			},
		},
	},
}

lspconfig.yamlls.setup { on_attach = custom_attach, capabilities = capabilities }
lspconfig.terraformls.setup { on_attach = custom_attach, capabilities = capabilities }
lspconfig.vimls.setup { on_attach = custom_attach, capabilities = capabilities }
