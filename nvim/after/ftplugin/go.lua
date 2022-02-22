local ok, mappings = pcall(require, "mn.mappings")
if not ok then
	emit "Unable to load mn.mappings"
	return
end

local opt = vim.opt_local
opt.list = false
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

local command = mappings.command
command("A", [[call go#alternate#Switch(<bang>0, 'edit')]])
command("AV", [[call go#alternate#Switch(<bang>0, 'vsplit')]])
command("AS", [[call go#alternate#Switch(<bang>0, 'split')]])
command("AT", [[call go#alternate#Switch(<bang>0, 'tabe')]])

local nmap = mappings.nmap
local buf_local_nmap = function(lhs, rhs)
	nmap(lhs, rhs, { buffer = true })
end

buf_local_nmap("†", "<Plug>(go-test-func)")
buf_local_nmap("db", "<Plug>(go-doc-browser)")
-- buf_local_nmap("de", "<Plug>(go-def-vertical)")
-- buf_local_nmap("gc", "<Plug>(go-callers)")
-- buf_local_nmap("gf", "<Plug>(go-referrers)")
-- buf_local_nmap("gi", "<Plug>(go-implements)")
-- buf_local_nmap("gr", "<Plug>(go-rename)")
buf_local_nmap("tc", "<Plug>(go-coverage-toggle)")

_G.build_go_files = function()
	local f = vim.fn.expand "%"
	if string.endswith(f, "_test.go") then
		vim.fn["go#test#Test"](0, 1)
	elseif string.endswith(f, ".go") then
		vim.cmd "GoBuild -i"
	end
end

local nnoremap = mappings.nnoremap
local buf_local_nnoremap = function(lhs, rhs)
	nnoremap(lhs, rhs, { buffer = true })
end

buf_local_nnoremap("gb", ":lua build_go_files()<CR>")
buf_local_nnoremap("<C-g>", ":GoDeclsDir<CR>")

-- vim.cmd [[autocmd FileType go lua require("cmp").setup.buffer { completion = { autocomplete = false } }]]
