local M = {}

M.custom_init = function(client, init_result)
	vim.notify(
		string.format("%s language server started", client.name),
		vim.log.levels.INFO,
		{ title = "LSP", icon = "" }
	)
end

M.custom_exit = function(code, signal, client_id)
	local client = vim.lsp.get_client_by_id(client_id)
	vim.notify(
		string.format("%s language server stopped (%s)", client.name, signal),
		code == 0 and vim.log.levels.INFO or vim.log.levels.ERROR,
		{ title = "LSP", icon = "" }
	)
end

M.custom_error = function(code, ...)
	local msg = vim.lsp.rpc.client_errors[code]
	vim.notify(msg, vim.log.levels.ERROR, { title = "LSP", icon = "" })
end

M.custom_attach = function(client, bufnr)
	print(string.format([['%s' attached to buffer]], client.name))

	-- Options
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local buf_nnoremap = function(lhs, rhs)
		require("mn.lib").buf_nnoremap(lhs, rhs, { buffer = bufnr })
	end

	vim.keymap.set("n", "<leader>ld", "<Cmd>Telescope diagnostics<CR>", { desc = "search lsp diagnostics" })

	buf_nnoremap("gD", vim.lsp.buf.declaration)
	buf_nnoremap("<c-]>", vim.lsp.buf.definition)
	buf_nnoremap("K", vim.lsp.buf.hover)
	buf_nnoremap("<C-s>", vim.lsp.buf.signature_help)
	buf_nnoremap("<Leader>D", vim.lsp.buf.type_definition)
	buf_nnoremap("gr", vim.lsp.buf.rename)
	buf_nnoremap("<leader>ld", require("mn.lsp.support").show_line_diagnostics)
	buf_nnoremap("<Leader>ll", vim.diagnostic.setloclist)
	buf_nnoremap("<Leader>lf", vim.lsp.buf.formatting)
	buf_nnoremap("<Leader>la", vim.lsp.buf.code_action)
	buf_nnoremap("gl", vim.lsp.buf.incoming_calls)
	buf_nnoremap("gw", vim.lsp.buf.workspace_symbol)

	buf_nnoremap("gi", require("telescope.builtin").lsp_implementations)
	buf_nnoremap("gf", require("telescope.builtin").lsp_references)
	buf_nnoremap("<leader>li", require("telescope.builtin").lsp_incoming_calls)
	buf_nnoremap("<leader>lo", require("telescope.builtin").lsp_outgoing_calls)
	buf_nnoremap("<leader>ls", require("telescope.builtin").lsp_document_symbols)

	buf_nnoremap("de", function()
		require "telescope.builtin".lsp_definitions({ jump_type = "vsplit" })
	end)

	buf_nnoremap("[d", function()
		vim.diagnostic.goto_prev { float = { border = "rounded" } }
	end)

	buf_nnoremap("]d", function()
		vim.diagnostic.goto_next { float = { border = "rounded" } }
	end)

end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
	P "Unable to load cmp_nvim_lsp"
else
	M.capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
	M.capabilities.textDocument.completion.completionItem.snippetSupport = true
end

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

local diagnostics_enabled = true
M.toggle_diagnostics = function()
	if diagnostics_enabled then
		vim.notify("Disabling diagnostics...", vim.log.levels.INFO, { title = "LSP" })
		vim.diagnostic.disable()
		vim.diagnostic.reset(nil, 0)
		diagnostics_enabled = false
	else
		vim.notify("Enabling diagnostics...", vim.log.levels.INFO, { title = "LSP" })
		vim.diagnostic.enable()
		diagnostics_enabled = true
	end
end

M.base_config = {
	on_init = M.custom_init,
	on_attach = M.custom_attach,
	on_exit = M.custom_exit,
	on_error = M.custom_error,
	capabilities = M.capabilities,
}

return M
