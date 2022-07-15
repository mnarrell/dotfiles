local inoremap = require("mn.lib").inoremap
local xnoremap = require("mn.lib").xnoremap
local onoremap = require("mn.lib").onoremap

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
-- local expr = { expr = true, noremap = false, silent = true }
-- vim.keymap.set("i", "<CR>", require("nvim-autopairs").check_break_line_char, expr)

local opts = { expr = true, silent = true }
inoremap("<CR>", require("nvim-autopairs").check_break_line_char, opts)
