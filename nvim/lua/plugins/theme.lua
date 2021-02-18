local cmd = vim.api.nvim_command

local base16 = require('base16')
local theme = base16.themes['tomorrow-night']
base16(theme, true)

local function hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  local parts = {group}
  -- table.insert(parts, 'guifg=' .. (guifg or 'none'))
  if guifg then table.insert(parts, "guifg="..guifg) end
  if guibg then table.insert(parts, "guibg="..guibg) end
  if ctermfg then table.insert(parts, "ctermfg="..ctermfg) end
  if ctermbg then table.insert(parts, "ctermbg="..ctermbg) end
  if attr then
    table.insert(parts, "gui="..attr)
    table.insert(parts, "cterm="..attr)
  end
  if guisp then table.insert(parts, "guisp=#"..guisp) end

  vim.api.nvim_command('highlight '..table.concat(parts, ' '))
end

local function set_highlights()
  local t1 = '#' .. theme.base01
  local td = '#' .. theme.base0D

  hi('CursorLineNr', td, nil, nil, nil, 'bold', nil)
  hi('IncSearch','YELLOW', td, nil, nil, nil, nil)
  hi('HighlightedyankRegion', nil, td, nil, nil, nil, nil)

  hi('LspDiagnosticsSignError', 'Red', t1, nil, nil, nil, nil)
  hi('LspDiagnosticsSignWarning', 'Yellow', t1, nil, nil, nil, nil)
  hi('LspDiagnosticsSignHint', td, t1, nil, nil, nil, nil)

  -- cmd('highlight! Pmenu ctermbg=18')
  -- cmd('highlight! Pmenu ctermbg=18 guibg=%s')
  hi('PmenuSbar', nil, td, nil, '18', nil, nil)
  hi('PmenuSel', nil, td, nil, '18', nil, nil)
  hi('PmenuThumb', nil, td, nil, 'Blue', 'bold', nil)

  cmd('highlight! link QuickFixLine PmenuSel')
  cmd('highlight! link Search Underlined')
end

set_highlights()

require('tools').create_autocmds({
  loupe = {{'ColorScheme', '*', function()
    set_highlights()
    -- require('vim.lsp.diagnostic')._define_default_signs_and_highlights()
  end}}
})
