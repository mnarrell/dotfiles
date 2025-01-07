require("mn.config.globals")
require("mn.config.options")

require("mn.config.lazy")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("mn.config.filetypes")
    require("mn.config.autocmds")
    require("mn.config.keymaps")
  end,
})
