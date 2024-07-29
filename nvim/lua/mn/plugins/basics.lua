return {
  -- Eyecandy
  { "kshenoy/vim-signature" }, -- show marks
  { "kyazdani42/nvim-web-devicons" },

  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      { "-", "<cmd>Oil<cr>" },
    },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    config = true,
  },

  { "almo7aya/openingh.nvim" },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  { "MunifTanjim/nui.nvim" },

  -- Basics
  -- { "tpope/vim-abolish" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  -- { "tweekmonster/startuptime.vim", cmd = "StartupTime" },
  -- { "tpope/vim-scriptease", cmd = { "Messages", "Verbose" } },
  { "tpope/vim-eunuch", cmd = { "Rename", "Remove", "Delete", "Move", "Chmod", "Mkdir" } },
  { "wincent/loupe" },
  -- { "romainl/vim-qf" },

  -- Navigation
  { "gennaro-tedesco/nvim-peekup" },
  { "markonm/traces.vim" },
  { "godlygeek/tabular", cmd = "Tabularize" },
  { "AndrewRadev/splitjoin.vim" },

  -- {
  --   "echasnovski/mini.nvim",
  --   config = function()
  --     require("mini.completion").setup()
  --     require("mini.pairs").setup()
  --   end,
  -- },
}
