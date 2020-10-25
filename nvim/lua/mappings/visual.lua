require('tools').apply_mappings({
  {'v', '.', ':normal .<CR>'},  -- allow . to execute once for each line of a visual selection
  {'v', 'Q', ':normal @q<CR>'}, -- allow Q to execute the macro in qq over a visual selection
  {'x', '<', '<gv'},
  {'x', '>', '>gv'},
  {'x', '=', '>gv'},
}, {noremap = true, silent = true})
