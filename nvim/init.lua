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

-- Machine local settings...
pcall(require, "mn.local")

-- vim.cmd([[colorscheme kanagawa]])
vim.cmd("colorscheme kanagawa-dragon")
-- vim.g.material_style = "darker"
-- vim.cmd("colorscheme material")

-- vim.api.nvim_set_hl(0, "EndOfBuffer", { link = "SignColumn" })
-- vim.api.nvim_set_hl(0, "NoText", { link = "SignColumn" })
-- vim.api.nvim_set_hl(0, "LineNr", { link = "SignColumn" })
