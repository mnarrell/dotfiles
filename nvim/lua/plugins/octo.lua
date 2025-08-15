return {
  "pwntester/octo.nvim",
  -- enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-telescope/telescope.nvim",
    "folke/snacks.nvim",
    -- OR 'ibhagwan/fzf-lua',
    -- OR 'folke/snacks.nvim',
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    picker = "snacks",
    enable_builtin = true,
  },
}
