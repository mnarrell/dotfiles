local nnoremap = function(lhs, rhs)
	vim.keymap.set("n",lhs,rhs, { noremap = true, silent = true})
end

nnoremap("<Leader>gb", ":Git blame<CR>")
nnoremap("<Leader>gd", ":Gvdiff<CR>")
nnoremap("<Leader>gr", ":Gread<CR> :w <CR>")
nnoremap("<Leader>gs", ":Git<CR>")
