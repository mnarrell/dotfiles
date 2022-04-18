local function noremap(mode, lhs, rhs, opts)
	local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
	vim.keymap.set(mode, lhs, rhs, options)
end

local function vnoremap(...)
	noremap("v", ...)
end

local function xnoremap(...)
	noremap("x", ...)
end

vnoremap(".", ":normal .<CR>")
vnoremap("Q", ":normal @q<CR>")
xnoremap("<", "<gv")
xnoremap(">", ">gv")
xnoremap("=", ">gv")
