require('tools').apply_mappings({
  {'t', '<Esc>', [[<C-\><C-n>]]},
  {'t', '<leader>tv', ':vsplit<cr>:term<CR>'},
  {'t', '<leader>ts', ':split<cr>:term<CR>'},
  {'t', '<leader>tt', ':tabnew<cr>:term<CR>'},
  {'t', '<Leader>q', ':bd!<CR>'},
}, {noremap = true, silent = true})
