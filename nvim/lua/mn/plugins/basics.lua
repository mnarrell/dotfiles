return {
  -- Show marks in the sign column
  { "kshenoy/vim-signature", event = "VeryLazy" },

  -- Eyecandy
  { "kyazdani42/nvim-web-devicons" },

  -- Best file manager
  {
    "stevearc/oil.nvim",
    event = { "VimEnter */*,.*", "BufNew */*,.*" },
    keys = { { "-", vim.cmd.Oil } },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    config = true,
  },

  -- Open line/file in GitHub
  { "almo7aya/openingh.nvim" },

  -- Color strings
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- Convenience for building UI components.
  { "MunifTanjim/nui.nvim" },

  -- Allow the dot to repeat more actions
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-surround" },

  -- Pair-wise operations. If you know, you know.
  { "tpope/vim-unimpaired", event = "VeryLazy" },

  -- Profiling
  { "tweekmonster/startuptime.vim", cmd = "StartupTime" },

  -- Best search tweaks so far
  { "wincent/loupe" },

  -- Inspect registers
  { "gennaro-tedesco/nvim-peekup" },

  -- Live substitute preview
  { "markonm/traces.vim" },

  -- Align things in columns
  { "godlygeek/tabular", cmd = "Tabularize" },
}
