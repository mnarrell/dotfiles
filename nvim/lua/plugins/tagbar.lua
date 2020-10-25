vim.g.tagbar_width = 80

require('tools').apply_mappings({
  {'n', '<F8>', [[:TagbarOpenAutoClose<CR>]]}
}, {silent = true, noremap = true})
