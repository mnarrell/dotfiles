return {
  -- Show marks in the sign column
  -- { "kshenoy/vim-signature", event = "VeryLazy" },

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
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-r>"] = "actions.refresh",
      },
    },
    config = true,
  },

  -- Color strings
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- Allow the dot to repeat more actions
  { "tpope/vim-repeat", event = "VeryLazy" },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Pair-wise operations. If you know, you know.
  { "tpope/vim-unimpaired", event = "VeryLazy" },

  -- Profiling
  { "tweekmonster/startuptime.vim", cmd = "StartupTime" },

  -- Best search tweaks so far
  { "wincent/loupe", event = "VeryLazy" },

  -- Inspect registers
  -- { "gennaro-tedesco/nvim-peekup", event = "VeryLazy" },

  -- Live substitute preview
  { "markonm/traces.vim", event = "VeryLazy" },

  -- Align things in columns
  { "godlygeek/tabular", cmd = "Tabularize" },
}
