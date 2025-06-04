require("globals")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("keymaps")
require("autocmds")

---@type LazySpec
local plugins = "plugins"

require("lazy").setup(plugins, {
  ui = { border = "rounded" },
  -- install = { missing = false },
  change_detection = { notify = false },
  rocks = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "rplugin",
        "tohtml",
        "tutor",
      },
    },
  },
})

require("lsp")
