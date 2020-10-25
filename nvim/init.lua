vim.api.nvim_command('filetype indent plugin on')
vim.api.nvim_command('syntax enable')

require('tools').create_backup_dirs()

require('options')
require('autocmds')
require('plugins')
require('lsp')
require('mappings.command')
require('mappings.insert')
require('mappings.normal')
require('mappings.terminal')
require('mappings.visual')
require('filetypes')
