local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	vim.notify("Unable to load lspconfig", vim.log.levels.ERROR)
	return
end

local signs = { Error = "✗ ", Warn = " ", Hint = " ", Info = "𝓲 " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

vim.diagnostic.config { virtual_text = false }

local support = require "mn.lsp.support"

require "mn.lsp.lua"
require "mn.lsp.golang"
require "mn.lsp.null-ls"

lspconfig.yamlls.setup {
	capabilities = support.capabilities(),
	on_attach = support.on_attach,
}

lspconfig.dockerls.setup {
	capabilities = support.capabilities(),
	on_attach = support.on_attach,
	root_dir = function(fname)
		return lspconfig.util.find_git_ancestor(fname)
	end,
}

lspconfig.ansiblels.setup {
	on_attach = support.on_attach,
	capabilities = support.capabilities(),
}

lspconfig.bashls.setup {
	on_attach = function(client, bufnr)
		if client.supports_method "textDocument/formatting" then
			local autocmds = vim.api.nvim_create_augroup("bashAutocmds", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function(args)
					vim.lsp.buf.format { bufnr = args.buf }
				end,
				group = autocmds,
			})
		end
		support.on_attach(client, bufnr)
	end,
	capabilities = support.capabilities(),
	filetypes = { "sh", "bash" },
}

lspconfig.terraformls.setup {
	on_attach = support.on_attach,
	capabilities = support.capabilities(),
}

lspconfig.pyright.setup {
	on_attach = support.on_attach,
	capabilities = support.capabilities(),
}

local autocmds = vim.api.nvim_create_augroup("lspAutocmds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	callback = function(_)
		vim.keymap.set("n", "q", ":close", { silent = true, buffer = true })
	end,
	pattern = "lspinfo",
	group = autocmds,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		-- vim.notify(client.name .. " attached to dis", vim.lsp.log_levels.INFO)
-- 		support.mappings(args.data.client_id)
-- 	end,
-- 	group = autocmds,
-- })
