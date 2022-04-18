local history = function(earlier)
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

-- Mappings.
local function nnoremap(lhs, rhs, opts)
	local options = vim.tbl_extend("force", {
		noremap = true,
		silent = true,
	}, opts or {})
	vim.keymap.set("n", lhs, rhs, options)
end

nnoremap("<left>", function()
	history(false)
end)

nnoremap("<right>", function()
	history(true)
end)
