if not pcall(require, "mn.mappings") then
	return
end

local nnoremap = require("mn.mappings").nnoremap

_G.history = function(earlier)
	return function()
		local winnr = vim.api.nvim_eval "winnr()"
		local win_info = vim.tbl_filter(function(item)
			return item.winnr == winnr
		end, vim.api.nvim_eval "getwininfo()")
		-- require('mn.mappings').emit(nt)

		local lt = win_info.loclist and "l" or "c"
		local dir = earlier and "newer" or "older"
		vim.api.nvim_command(lt .. dir)
	end
end

nnoremap("<left>", ":lua history(false)<CR>")
nnoremap("<right>", ":lua history(true)<CR>")
