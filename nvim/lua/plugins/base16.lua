local cmd = vim.api.nvim_command
local path = require('plenary').path
local env = require('env')

cmd('syntax on')

vim.o.background = 'dark'
vim.g.base16colorspace = 256

local background = path:new(env.home .. '/.vimrc_background')
if background:exists() then cmd('source ' .. background.filename) end

local function set_highlights()
  local t4 = vim.g.terminal_color_4

  cmd(string.format('highlight! CursorLineNr ctermfg=Blue cterm=bold guifg=%s', t4))
  cmd(string.format('highlight! HighlightedyankRegion ctermbg=Blue guibg=%s', t4))
  cmd(string.format('highlight! IncSearch ctermfg=White ctermbg=Red cterm=bold guifg=White guibg=%s', t4))

  cmd('highlight! LspDiagnosticsSignError guibg=#282a2e guifg=Red')
  cmd('highlight! LspDiagnosticsSignWarning guibg=#282a2e guifg=Yellow')
  cmd('highlight! LspDiagnosticsSignHint guibg=#282a2e guifg=' .. t4)

  -- cmd('highlight! Pmenu ctermbg=18')
  -- cmd('highlight! Pmenu ctermbg=18 guibg=%s')
  cmd('highlight! PmenuSbar ctermbg=18 guibg=Black')
  cmd(string.format('highlight! PmenuSel ctermbg=Blue cterm=bold guibg=%s', t4))
  cmd(string.format('highlight! PmenuThumb ctermbg=Blue guibg=%s', t4))

  cmd('highlight! link QuickFixLine PmenuSel')
  cmd('highlight! link Search Underlined')
end

set_highlights()

require('tools').create_autocmds({
  loupe = {{'ColorScheme', '*', function()
    set_highlights()
    require('vim.lsp.diagnostic')._define_default_signs_and_highlights()
  end}}
})
