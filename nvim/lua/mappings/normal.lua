-- vim.keymap.nnoremap { 'm<CR>', '<cmd>Make!<CR>' }

require('tools').apply_mappings({
  -- {'n', '<Leader>y', '<Plug>(Luadev-RunWord)'},
  {'n', '<Leader>o', ':only<CR>'},
  {'n', '<Leader>q', ':quit<CR>'},
  {'n', '<Leader>x', ':xit<CR>'},
  {'n', '<Leader>v', ':vsp<CR>'},
  {'n', '<Leader>s', ':sp<CR>'},
  {'n', '<Leader>k', ':bd!<CR>'},
  {'n', '<Leader>w', ':<C-u>call functions#SaveAndExec()<CR>'},

  {'n', '<leader>tv', ':vsplit<cr>:term<CR>'},
  {'n', '<leader>ts', ':split<cr>:term<CR>'},
  {'n', '<leader>tt', ':tabnew<cr>:term<CR>'},

  -- Make Y behave like C and D
  {'n', 'Y', 'y$'},

  -- Split navigation
  {'n', '<C-j>', '<C-w>j'},
  {'n', '<C-k>', '<C-w>k'},
  {'n', '<C-h>', '<C-w>h'},
  {'n', '<C-l>', '<C-w>l'},

  -- Split resizing
  {'n', '˙', '<C-w>5<'}, -- Option-H
  {'n', '∆', '<C-w>-'},  -- Option-J
  {'n', '˚', '<C-w>+'},  -- Option-K
  {'n', '¬', '<C-w>5>'}, -- Option-L
  {'n', '<leader>=', ':wincmd =<CR>'},

  -- Scroll the viewport faster
  {'n', '<C-e>', '5<C-e>'},
  {'n', '<C-y>', '5<C-y>'},

  -- Force filetypes
  -- {'n', '_ba', ':set filetype=bash<CR>'},
  {'n', '_df', ':set filetype=Dockerfile<CR>'},
  {'n', '_hl', ':set filetype=helm<CR>'},
  {'n', '_js', ':set filetype=json<CR>'},
  {'n', '_lu', ':set filetype=lua<CR>'},
  {'n', '_md', ':set filetype=markdown<CR>'},
  {'n', '_py', ':set filetype=python<CR>'},
  {'n', '_sh', ':set filetype=sh<CR>'},
  {'n', '_tx', ':set filetype=text<CR>'},
  {'n', '_vi', ':set filetype=vim<CR>'},
  {'n', '_xm', ':set filetype=xml<CR>'},
  {'n', '_ya', ':set filetype=yaml<CR>'},
  {'n', '_zs', ':set filetype=zsh<CR>'},

  -- This was a nightmeer
  {'n', 'k', [[(v:count > 5 ? "m'" . v:count : '') . 'k']], {expr = true}},
  {'n', 'j', [[(v:count > 5 ? "m'" . v:count : '') . 'j']], {expr = true}},

  -- This was a challenge. Not sure if it's worth it.
  -- Clears search and Loupe highlights with <CR>, or <CR> if no selection...
  {
    'n', '<CR>',
    function()
      if vim.api.nvim_get_vvar('hlsearch') ~= 0 then
        vim.api.nvim_command('nohlsearch')
        vim.api.nvim_command('normal! call loupe#private#clean_highlight()<CR>')
      else
        local key = vim.api.nvim_replace_termcodes('<CR>', true, true, true)
        vim.api.nvim_feedkeys(key, 'n', true)
      end
    end
  },

  {'n', '<Up>', ':cprevious<CR>'},
  {'n', '<Down>', ':cnext<CR>'},

  {'n', '<leader>ll', ':<C-u>call functions#ToggleLocationList()<CR>'},
  {'n', '<leader>lq', ':<C-u>call functions#ToggleQuickFix()<CR>'},
}, {noremap = true, silent = true})

