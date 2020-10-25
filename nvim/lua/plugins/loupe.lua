require('tools').apply_mappings({{'n', '<C-_>', '<Plug>(LoupeClearHighlight)'}}, {})

local function loupe_highlight()
  vim.api.nvim_command('highlight! link QuickFixLine PmenuSel')
  vim.api.nvim_command('highlight! link Search Underlined')
  vim.api.nvim_command('highlight! clear Search')
end

loupe_highlight()
