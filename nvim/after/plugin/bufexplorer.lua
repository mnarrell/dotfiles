-- vim.g.bufExplorerDisableDefaultKeyMapping = 1


require("mn.mappings").nnoremap("<Leader>e", [[:lua vim.api.nvim_command('BufExplorer')<CR>]])
