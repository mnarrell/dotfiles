return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      { "<Leader>gd", ":Gvdiff<CR>", silent = true },
      { "<Leader>gr", ":Gread<CR> :w <CR>", silent = true },
      { "<LocalLeader>gd", ":diffget //2 <CR>", silent = true },
      { "<LocalLeader>gl", ":diffget //3 <CR>", silent = true },
      { "<Leader>gb", ":Git blame<CR>", silent = true },
      { "<Leader>gs", ":Git<CR>", silent = true },
    },
  },
  { "tpope/vim-rhubarb" },
}
