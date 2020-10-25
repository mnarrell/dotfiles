require('tools').apply_mappings({
  {'i', [[</]], [[</<C-x><C-o>]]}, -- Crude XML Tag completion

  -- Crude line text objects
  {'x', 'il', 'g_o^'},
  {'o', 'il', ':normal vil<CR>'},
  {'x', 'al', '$o0'},
  {'o', 'al', ':normal val<CR>'}
}, {noremap = true, silent = true})

