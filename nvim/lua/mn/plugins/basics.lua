return {
  -- Eyecandy
  { "tpope/vim-vinegar" },
  { "norcalli/nvim-colorizer.lua", config = true },
  { "kshenoy/vim-signature" }, -- show marks
  { "kyazdani42/nvim-web-devicons" },

  { "MunifTanjim/nui.nvim" },

  -- Basics
  { "tpope/vim-abolish" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "tweekmonster/startuptime.vim", cmd = "StartupTime" },
  { "tpope/vim-scriptease", cmd = { "Messages", "Verbose" } },
  { "tpope/vim-eunuch", cmd = { "Rename", "Remove", "Delete", "Move", "Chmod", "Mkdir" } },
  { "wincent/loupe" },
  { "romainl/vim-qf" },

  -- Navigation
  { "gennaro-tedesco/nvim-peekup" },
  { "markonm/traces.vim" },
  { "godlygeek/tabular", cmd = "Tabularize" },
  { "AndrewRadev/splitjoin.vim" },
}
