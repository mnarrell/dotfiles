local cmd = vim.api.nvim_command
local path = require('plenary').path
local env = require('env')

cmd('syntax on')

vim.o.background = 'dark'
vim.g.base16colorspace = 256

local background = path:new(env.home .. '/.vimrc_background')
if background:exists() then cmd('source ' .. background.filename) end

local function set_highlights()
  cmd('highlight! clear Search')
  cmd('highlight! clear SpellBad')

  cmd('highlight! CursorLineNr ctermfg=Blue cterm=bold')
  cmd('highlight! HighlightedyankRegion ctermbg=Blue')
  cmd('highlight! IncSearch ctermfg=White ctermbg=Red cterm=bold')
  cmd('highlight! Pmenu ctermbg=18')
  cmd('highlight! PmenuSbar ctermbg=18')
  cmd('highlight! PmenuSel ctermbg=Blue cterm=bold')
  cmd('highlight! PmenuThumb ctermbg=Blue')
  cmd('highlight! Search ctermfg=Red ctermbg=NONE cterm=underline')
  cmd('highlight! SpellBad cterm=underline,bold')
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
