return {
  {
    "tpope/vim-fugitive",
    event = LazyFile,
    keys = {
      { "<Leader>gd", ":Gvdiff<CR>", silent = true },
      { "<Leader>gr", ":Gread<CR> :w <CR>", silent = true },
      { "<LocalLeader>gd", ":diffget //2 <CR>", silent = true },
      { "<LocalLeader>gl", ":diffget //3 <CR>", silent = true },
      { "<Leader>gb", ":Git blame<CR>", silent = true },
      { "<Leader>gs", ":Git<CR>", silent = true },
    },
    config = function()
      vim.api.nvim_create_user_command("Browse", function(args)
        vim.ui.open(args.args)
      end, {
        desc = "Enables using GBrowse without netrw",
        force = true,
        nargs = 1,
      })
    end,
  },
  { "tpope/vim-rhubarb" },
}
