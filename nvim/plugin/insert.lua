local function noremap(mode, lhs, rhs, opts)
	local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
	vim.keymap.set(mode, lhs, rhs, options)
end

local function xnoremap(...)
	noremap("x", ...)
end

local function onoremap(...)
	noremap("o", ...)
end

local function inoremap(...)
	noremap("i", ...)
end

-- Crude XML Tag completion
inoremap([[</]], [[</<C-x><C-o>]])

-- Line text objects
xnoremap("il", "g_o^")
onoremap("il", ":normal vil<CR>")
xnoremap("al", "$o0")
onoremap("al", ":normal val<CR>")

-- _G.completion_confirm = function()
-- 	return require("nvim-autopairs").check_break_line_char()
-- end

-- vim.api.nvim_set_keymap('i', '<CR>','v:lua.completion_confirm()', {expr = true , noremap = true})
-- inoremap("<CR>", "v:lua.completion_confirm()", { expr = true })
vim.g.completion_confirm_key = ""
local expr = { expr = true, noremap = false, silent = true }
vim.keymap.set("i", "<CR>", require("nvim-autopairs").check_break_line_char, expr)
