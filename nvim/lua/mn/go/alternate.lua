local helpers = require "mn.go.helpers"

local M = {}

M.alternate = function(filename)
	if helpers.is_test(filename) then
		return string.gsub(filename, "_test.go", ".go")
	elseif helpers.is_source(filename) then
		return vim.fn.expand "%:r" .. "_test.go"
	else
		vim.notify("not a go file", vim.lsp.log_levels.ERROR)
	end
end

M.switch = function(cmd)
	local alt_file = M.alternate(vim.fn.expand "%")
	if not vim.fn.filereadable(alt_file) and not vim.fn.bufexists(alt_file) then
		vim.notify("couldn't find " .. alt_file, vim.lsp.log_levels.ERROR)
		return
	elseif #cmd <= 1 then
		local ocmd = "e " .. alt_file
		vim.cmd(ocmd)
	else
		local ocmd = cmd .. " " .. alt_file
		vim.cmd(ocmd)
	end
end

return M
