vim.g.bufExplorerDisableDefaultKeyMapping = 1

require('tools').nnoremap('<Leader>e', [[:lua vim.api.nvim_command('BufExplorer')<CR>]])
