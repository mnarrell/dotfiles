return {
  {
    "tpope/vim-fugitive",
    event = LazyFile,
    keys = {
      { "<Leader>gr", ":Gread<CR> :w <CR>", silent = true },
      { "<Leader>gb", ":Git blame<CR>", silent = true },
      { "<Leader>gs", ":Git<CR>", silent = true },
    },
  },
}
