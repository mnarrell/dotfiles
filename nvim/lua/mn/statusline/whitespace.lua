-- This is all shamelessly borrowed from galaxyline.nvim
-- https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_whitespace.lua

-- local options = {
-- 	c_langs = { "arduino", "c", "cpp", "cuda", "go", "javascript", "ld", "php" },
-- 	max_lines = 5000,
-- }

local M = {}

-- M.search = function(prefix, pattern)
	-- local line = vim.fn.search(pattern, "nw")
	-- if line == 0 then
	-- 	return ""
	-- end
	-- return string.format("[%s:%d]", prefix, line)
-- end

-- M.check_trailing = function()
-- 	return M.search("trailing", [[\s$]])
-- end

-- M.check_mix_indent = function()
-- 	local tst = [[(^\t* +\t\s*\S)]]
-- 	local tls = string.format([[(^\t+ {%d,}\S)]], vim.bo.tabstop)
-- 	local pattern = string.format([[\v%s|%s]], tst, tls)
-- 	return M.search("mix-indent", pattern)
-- end

M.check_mix_indent_file = function()
	local head_spc = [[\v(^ +)]]
	-- if vim.tbl_contains(options.c_langs, vim.bo.filetype) then
	-- 	head_spc = [[\v(^ +\*@!)]]
	-- end
	local indent_tabs = vim.fn.search([[\v(^\t+)]], "nw")
	local indent_spc = vim.fn.search(head_spc, "nw")
	if indent_tabs == 0 or indent_spc == 0 then
		return ""
	end
	return string.format("[mix-indent-file:%d,%d]", indent_spc, indent_tabs)
end

return M
