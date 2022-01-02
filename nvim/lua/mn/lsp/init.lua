local ok, lspconfig = pcall(require, "lspconfig")
if not ok then return end

local signs = { Error = "✗ ", Warn = " ", Hint = " ", Info = "𝓲 " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

-- vim.diagnostic.show_line_diagnostics { border = "single" }
vim.diagnostic.config {
	virtual_text = false,
	-- virtual_text = {
	-- 	source = "if_many",
	-- },
}

local support = require "mn.lsp.support"

lspconfig.sumneko_lua.setup(require("mn.lsp.lua").config)

-- lspconfig.gopls.setup(require("mn.lsp.support").base_config)
lspconfig.gopls.setup(require("mn.lsp.golang").config)

lspconfig.ansiblels.setup(require("mn.lsp.support").base_config)
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

-- local mn_null_ls = require "mn.lsp.null-ls"
-- require("lspconfig.configs")["null-ls"].setup(mn_null_ls.config)

require("mn.lsp.null-ls").setup(support.base_config.on_attach)
