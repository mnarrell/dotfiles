local signs = { Error = "✗ ", Warn = " ", Hint = " ", Info = "𝓲 " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 	signs = true,
-- 	underline = true,
-- 	update_in_insert = false,
-- 	virtual_text = false,
-- })

vim.diagnostic.config {
	virtual_text = false,
	-- virtual_text = {
	-- 	source = "if_many",
	-- },
}

-- local publishDiagnostics = "textDocument/publishDiagnostics"
-- local default_handler = vim.lsp.handlers[publishDiagnostics]
-- vim.lsp.handlers[publishDiagnostics] = function(err, method, result, client_id, bufnr, config)
-- 	default_handler(err, method, result, client_id, bufnr, config)
-- 	local diagnostics = vim.diagnostic.get(0)
-- 	local qflist = {}
-- 	for bn, diagnostic in pairs(diagnostics) do
-- 		for _, d in ipairs(diagnostic) do
-- 			table.insert(qflist, {
-- 				bufnr = bn,
-- 				lnum = d.range.start.line + 1,
-- 				col = d.range.start.character + 1,
-- 				text = d.message,
-- 			})
-- 		end
-- 	end
-- 	vim.diagnostic.setqflist(qflist)
-- end

-- vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable = false})]]

local lspconfig = require "lspconfig"
local support = require "mn.lsp.support"

lspconfig.sumneko_lua.setup(require("mn.lsp.lua").config)

-- lspconfig.gopls.setup(require("mn.lsp.support").base_config)
lspconfig.gopls.setup(require("mn.lsp.golang").config)

lspconfig.yamlls.setup(require("mn.lsp.support").base_config)
lspconfig.terraformls.setup(require("mn.lsp.support").base_config)
lspconfig.vimls.setup(require("mn.lsp.support").base_config)

lspconfig.dockerls.setup(vim.tbl_extend("force", support.base_config, {
	root_dir = function(fname)
		return lspconfig.util.find_git_ancestor(fname)
	end,
}))

lspconfig.jsonls.setup(vim.tbl_extend("force", support.base_config, {
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
			end,
		},
	},
}))

lspconfig.bashls.setup(vim.tbl_extend("force", support.base_config, {
	filetypes = { "sh", "zsh", "bash" },
}))

lspconfig.pyright.setup(vim.tbl_extend("force", support.base_config, {
	settings = {
		python = {
			formatting = {
				provider = "yapf",
			},
		},
	},
}))

local mn_null_ls = require "mn.lsp.null-ls"
require("lspconfig.configs")["null-ls"].setup(mn_null_ls.config)
