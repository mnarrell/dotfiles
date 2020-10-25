require('tools').apply_mappings({
  {'n', '<Leader>gb', ':Gblame<CR>'},
  {'n', '<Leader>gd', ':Gvdiff<CR>'},
  {'n', '<Leader>gr', ':Gread<CR> :w <CR>'},
  {'n', '<Leader>gs', ':Gstatus<CR>'},
}, {silent = true, noremap = true})
