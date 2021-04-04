local xnoremap = require('tools').xnoremap
local onoremap = require('tools').onoremap
local inoremap = require('tools').inoremap

inoremap([[</]], [[</<C-x><C-o>]])  -- Crude XML Tag completion

-- Line text objects
xnoremap('il', 'g_o^')
onoremap('il', ':normal vil<CR>')
xnoremap('al', '$o0')
onoremap('al', ':normal val<CR>')

vim.g.completion_confirm_key = ""

_G.completion_confirm = function()
    return require('nvim-autopairs').check_break_line_char()
end

-- vim.api.nvim_set_keymap('i', '<CR>','v:lua.completion_confirm()', {expr = true , noremap = true})
require('tools').inoremap('<CR>','v:lua.completion_confirm()', {expr = true})
