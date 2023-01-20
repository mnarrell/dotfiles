return {
  "jlanzarotta/bufexplorer",
  init = function()
    vim.g.bufExplorerDisableDefaultKeyMapping = 1
  end,
  keys = {
    { "<Leader>e", ":BufExplorer<CR>", silent = true },
  },
}
