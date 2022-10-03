-- Options
local opt = vim.opt_local
opt.list = false
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldnestmax = 10
opt.foldenable = false
opt.foldlevel = 2

-- Commands
local cmd = function(lhs, rhs)
	vim.api.nvim_create_user_command(lhs, rhs, { bang = true })
end

local alt = require "mn.go.alternate"

cmd("A", function()
	alt.switch ""
end)

cmd("AS", function()
	alt.switch "split"
end)

cmd("AV", function()
	alt.switch "vsplit"
end)

cmd("AT", function()
	alt.switch "tabe"
end)

-- Mappings
local map = function(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { buffer = true, silent = true })
end

-- map("<C-g>", ":GoDeclsDir<CR>")
map("gb", require("mn.go.build").build)

local cmp = require "cmp"
cmp.setup.buffer {
	-- completion = {
	-- 	autocomplete = false
	-- },
	sources = cmp.config.sources {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
	},
}
