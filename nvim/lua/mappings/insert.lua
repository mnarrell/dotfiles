require('tools').apply_mappings({
  {'i', [[</]], [[</<C-x><C-o>]]}, -- Crude XML Tag completion

  -- Crude line text objects
  {'x', 'il', 'g_o^'},
  {'o', 'il', ':normal vil<CR>'},
  {'x', 'al', '$o0'},
  {'o', 'al', ':normal val<CR>'}
}, {noremap = true, silent = true})

vim.g.completion_confirm_key = ""

-- _G.MUtils= {}
-- MUtils.completion_confirm=function()
--     return require('nvim-autopairs').check_break_line_char()
-- end
-- vim.api.nvim_set_keymap('i', '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

_G.completion_confirm = function()
    return require('nvim-autopairs').check_break_line_char()
end
vim.api.nvim_set_keymap('i', '<CR>','v:lua.completion_confirm()', {expr = true , noremap = true})
