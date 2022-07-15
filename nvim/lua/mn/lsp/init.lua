local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	vim.notify ("Unable to load lspconfig", vim.log.levels.ERROR)
	return
end

local signs = { Error = "✗ ", Warn = " ", Hint = " ", Info = "𝓲 " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

vim.diagnostic.config {
	virtual_text = false,
	-- virtual_text = {
	-- 	source = "if_many",
	-- },
}

lspconfig.sumneko_lua.setup(require("mn.lsp.lua").config)
lspconfig.gopls.setup(require("mn.lsp.golang").config)
lspconfig.yamlls.setup(require("mn.lsp.yaml").config)

local support = require "mn.lsp.support"
lspconfig.ansiblels.setup(support.base_config)
lspconfig.terraformls.setup(support.base_config)
lspconfig.vimls.setup(support.base_config)

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

-- require("mn.lsp.null-ls").setup()
