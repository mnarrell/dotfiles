local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
	vim.notify("Unable to load gitsigns", vim.log.levels.ERROR)
	return
end

gitsigns.setup {
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
