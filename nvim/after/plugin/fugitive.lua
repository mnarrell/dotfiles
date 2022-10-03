local map = function(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { silent = true })
end

map("<Leader>gb", ":Git blame<CR>")
map("<Leader>gd", ":Gvdiff<CR>")
map("<Leader>gr", ":Gread<CR> :w <CR>")
map("<Leader>gs", ":Git<CR>")
map("<LocalLeader>gd", ":diffget //2 <CR>")
map("<LocalLeader>gl", ":diffget //3 <CR>")
