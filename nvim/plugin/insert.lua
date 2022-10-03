local map = function(mode, lhs, rhs, opts)
	opts = opts or { silent = true }
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Crude XML Tag completion
map("i", [[</]], [[</<C-x><C-o>]])

-- Line text objects
map("x", "il", "g_o^")
map("o", "il", ":normal vil<CR>")
map("x", "al", "$o0")
map("o", "al", ":normal val<CR>")

vim.g.completion_confirm_key = ""
local opts = { expr = true, silent = true }
map("i", "<CR>", require("nvim-autopairs").check_break_line_char, opts)
