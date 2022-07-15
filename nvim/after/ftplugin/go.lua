-- Options
local opt = vim.opt_local
opt.list = false
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Commands
local command = require("mn.lib").command
command("A", [[call go#alternate#Switch(<bang>0, 'edit')]])
command("AV", [[call go#alternate#Switch(<bang>0, 'vsplit')]])
command("AS", [[call go#alternate#Switch(<bang>0, 'split')]])
command("AT", [[call go#alternate#Switch(<bang>0, 'tabe')]])

local buf_nmap = require("mn.lib").buf_nmap
buf_nmap("†", "<Plug>(go-test-func)")
buf_nmap("db", "<Plug>(go-doc-browser)")
buf_nmap("tc", "<Plug>(go-coverage-toggle)")


local buf_nnoremap = require("mn.lib").buf_nnoremap
buf_nnoremap("<C-g>", ":GoDeclsDir<CR>")
buf_nnoremap("gb", function()
	local f = vim.api.nvim_buf_get_name(0)
	if string.endswith(f, "_test.go") then
		vim.fn["go#test#Test"](0, 1)
	elseif string.endswith(f, ".go") then
		vim.cmd "GoBuild -i"
	end
end)

local cmp = require("cmp")
cmp.setup.buffer {
	completion = {
		autocomplete = false
	},
	sources = cmp.config.sources {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
	},
}
