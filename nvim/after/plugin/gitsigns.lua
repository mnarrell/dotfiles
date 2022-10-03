if not pcall(require, "gitsigns") then
	return
end

require("gitsigns").setup {
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		local map = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { silent = true, buffer = bufnr, expr = true })
		end

		map("]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end)

		map("[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end)
	end,
}
