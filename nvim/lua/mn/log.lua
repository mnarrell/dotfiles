local path = string.format('%s/mn.log', vim.fn.stdpath 'cache')

local M = {}

M.log = function(msg)
	local file = io.open(path, 'a')
	io.output(file)
	io.write(msg .. '\n')
	io.close(file)
end

return M
