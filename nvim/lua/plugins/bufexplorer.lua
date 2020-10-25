vim.g.bufExplorerDisableDefaultKeyMapping = 1

require('tools').apply_mappings({
  {'n', '<Leader>e', function() vim.api.nvim_command('BufExplorer') end}
}, {silent = true, noremap = true})
