require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {enable = true},
  -- autotag = {enable = true},
  refactor = {
    -- highlight_definitions = {enable = true},
  --   highlight_current_scope = {enable = false},
  --   smart_rename = {
  --     enable = true,
  --     keymaps = {
  --       -- mapping to rename reference under cursor
  --       smart_rename = 'gy'
  --     }
  --   }
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- ['af'] = '@function.outer',
        -- ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['aC'] = '@class.outer',
        ['iC'] = '@class.inner',
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
      }
    }
  }
}
