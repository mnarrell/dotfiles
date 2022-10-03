local map = function(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("v", ".", ":normal .<CR>")
map("v", "Q", ":normal @q<CR>")
map("x", "<", "<gv")
map("x", ">", ">gv")
map("x", "=", ">gv")
