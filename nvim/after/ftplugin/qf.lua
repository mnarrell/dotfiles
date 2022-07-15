local history = function(earlier)
	return function()
		local winnr = vim.api.nvim_eval "winnr()"
		local win_info = vim.tbl_filter(function(item)
			return item.winnr == winnr
		end, vim.api.nvim_eval "getwininfo()")

		local lt = win_info.loclist and "l" or "c"
		local dir = earlier and "newer" or "older"
		vim.api.nvim_command(lt .. dir)
	end
end

local nnoremap = require("mn.lib").nnoremap
nnoremap("<left>", function()
	history(false)
end)

nnoremap("<right>", function()
	history(true)
end)
