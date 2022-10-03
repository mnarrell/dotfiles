local M = {}

M.is_test = function(filename)
	return filename:find "_test%.go$"
end

M.is_source = function(filename)
	return filename:find "%.go$"
end

M.info = function(msg)
	vim.api.nvim_echo({ { msg, "Function" } }, false, {})
end

M.error = function(msg)
	vim.api.nvim_echo({ { msg, "ErrorMsg" } }, false, {})
end

return M
