-- Options
local opt = vim.opt_local
opt.list = false
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Commands
local command = function(lhs, rhs, opts)
	local options = vim.tbl_extend("force", { bang = true }, opts or {})
	vim.api.nvim_create_user_command(lhs, rhs, options)
end

command("A", [[call go#alternate#Switch(<bang>0, 'edit')]])
command("AV", [[call go#alternate#Switch(<bang>0, 'vsplit')]])
command("AS", [[call go#alternate#Switch(<bang>0, 'split')]])
command("AT", [[call go#alternate#Switch(<bang>0, 'tabe')]])

-- Mappings
local function buf_nmap(lhs, rhs, opts)
	local options = vim.tbl_extend("force", {
		noremap = false,
		silent = false,
		buffer = true,
	}, opts or {})
	vim.keymap.set("n", lhs, rhs, options)
end

buf_nmap("†", "<Plug>(go-test-func)")
buf_nmap("db", "<Plug>(go-doc-browser)")
-- buf_nmap("de", "<Plug>(go-def-vertical)")
-- buf_nmap("gc", "<Plug>(go-callers)")
-- buf_nmap("gf", "<Plug>(go-referrers)")
-- buf_nmap("gi", "<Plug>(go-implements)")
-- buf_nmap("gr", "<Plug>(go-rename)")
buf_nmap("tc", "<Plug>(go-coverage-toggle)")

-- _G.build_go_files = function()
-- 	local f = vim.fn.expand "%"
-- 	if string.endswith(f, "_test.go") then
-- 		vim.fn["go#test#Test"](0, 1)
-- 	elseif string.endswith(f, ".go") then
-- 		vim.cmd "GoBuild -i"
-- 	end
-- end

local function buf_nnoremap(lhs, rhs, opts)
	local options = vim.tbl_extend("force", {
		noremap = true,
		silent = true,
		buffer = true,
	}, opts or {})
	vim.keymap.set("n", lhs, rhs, options)
end

buf_nnoremap("<C-g>", ":GoDeclsDir<CR>")
-- buf_nnoremap("gb", ":lua build_go_files()<CR>")
buf_nnoremap("gb", function()
	local f = vim.fn.expand "%"
	if string.endswith(f, "_test.go") then
		vim.fn["go#test#Test"](0, 1)
	elseif string.endswith(f, ".go") then
		vim.cmd "GoBuild -i"
	end
end)

-- vim.cmd [[autocmd FileType go lua require("cmp").setup.buffer { completion = { autocomplete = false } }]]
