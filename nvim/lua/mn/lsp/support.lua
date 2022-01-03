local M = {}

-- M.custom_init = function(client)
-- 	client.config.flags = client.config.flags or {}
-- 	client.config.flags.allow_incremental_sync = true
-- end

M.show_line_diagnostics = function()
	local opts = {
		focusable = false,
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		border = "rounded",
		-- border = "single",
		source = "always", -- show source in diagnostic popup window
		prefix = " ",
	}
	vim.diagnostic.open_float(nil, opts)
end

M.custom_attach = function(client, bufnr)
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
	buf_set_keymap("n", "de", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<Leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<Leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gr", [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], opts)
	buf_set_keymap("n", "<Leader>d", [[<cmd>lua require("mn.lsp.support").show_line_diagnostics()<CR>]], opts)
	buf_set_keymap("n", "[d", [[<cmd>lua vim.diagnostic.goto_prev({float={border="rounded"}})<CR>]], opts)
	buf_set_keymap("n", "]d", [[<cmd>lua vim.diagnostic.goto_next({float={border="rounded"}}}<CR>]], opts)
	-- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap("n", "<Leader>ll", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
	emit "Unable to load cmp_nvim_lsp"
else
M.capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

end

local diagnostics_enabled = true
M.toggle_diagnostics = function()
	if diagnostics_enabled then
		vim.notify "Disabling diagnostics..."
		vim.diagnostic.disable()
		diagnostics_enabled = false
	else
		vim.notify "Enabling diagnostics..."
		vim.diagnostic.enable()
		diagnostics_enabled = true
	end
end

M.base_config = {
	-- on_init = M.custom_init,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
}

return M
