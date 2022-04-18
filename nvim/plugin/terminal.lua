local function tnoremap(lhs, rhs, opts)
	local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
	vim.keymap.set("t", lhs, rhs, options)
end

tnoremap("<Esc>", [[<C-\><C-n>]])
tnoremap("<Leader>q", [[<C-\><C-n> :bd!<CR>]])
