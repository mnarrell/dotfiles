local function noremap(mode, lhs, rhs, opts)
	local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
	vim.keymap.set(mode, lhs, rhs, options)
end

local map = function(mode, lhs, rhs, opts)
	local options = vim.tbl_extend("force", { noremap = false, silent = false }, opts or {})
	vim.keymap.set(mode, lhs, rhs, options)
end

local M = {}

M.nnoremap = function(...)
	noremap("n", ...)
end

M.xnoremap = function(...)
	noremap("x", ...)
end

M.onoremap = function(...)
	noremap("o", ...)
end

M.inoremap = function(...)
	noremap("i", ...)
end

M.vnoremap = function(...)
	noremap("v", ...)
end

M.buf_nnoremap = function(lhs, rhs, opts)
	local options = vim.tbl_extend("force", { buffer = true }, opts or {})
	noremap("n", lhs, rhs, options)
end

M.buf_nmap = function(lhs, rhs, opts)
	local options = vim.tbl_extend("force", { buffer = true }, opts or {})
	noremap("n", lhs, rhs, options)
end

M.tnoremap = function(lhs, rhs, opts)
	local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
	noremap("t", lhs, rhs, options)
end

M.imap = function(...)
	map("i", ...)
end

M.command = function(lhs, rhs, opts)
	local options = vim.tbl_extend("force", { bang = true }, opts or {}) or {}
	vim.api.nvim_create_user_command(lhs, rhs, options)
end

return M
