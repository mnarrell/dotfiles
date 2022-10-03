local map = function(lhs, rhs)
	vim.keymap.set("t", lhs, rhs, { silent = true })
end

map("<Esc>", [[<C-\><C-n>]])
map("<Leader>q", [[<C-\><C-n> :bd!<CR>]])
