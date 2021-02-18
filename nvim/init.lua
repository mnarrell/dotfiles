vim.api.nvim_command('filetype indent plugin on')
vim.api.nvim_command('syntax enable')

require('tools').create_backup_dirs()

require('options').set_globals()
require('autocmds')
require('plugins')
require('lsp')
require('mappings')
require('filetypes')
