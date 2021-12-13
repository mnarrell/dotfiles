if not pcall(require, 'mn.mappings') then
  return
end

local xnoremap = require('mn.mappings').xnoremap
local onoremap = require('mn.mappings').onoremap
local inoremap = require('mn.mappings').inoremap

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
inoremap('<CR>','v:lua.completion_confirm()', {expr = true})
