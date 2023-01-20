return {
  "fweep/vim-tabber",
  init = function()
    vim.g.tabber_filename_style = "relative"
    vim.g.tabber_divider_style = "compatible"
    vim.opt.tabline = "%!tabber#TabLine()"
  end,
}
