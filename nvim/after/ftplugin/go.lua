-- Options
local opt = vim.opt_local
opt.list = false
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Commands
local cmd = function(lhs, rhs)
  vim.api.nvim_create_user_command(lhs, rhs, { bang = true })
end

local alt = require("mn.go.alternate")

cmd("A", function()
  alt.switch("")
end)

cmd("AS", function()
  alt.switch("split")
end)

cmd("AV", function()
  alt.switch("vsplit")
end)

cmd("AT", function()
  alt.switch("tabe")
end)

-- Mappings
local map = function(lhs, rhs)
  vim.keymap.set("n", lhs, rhs, { buffer = true, silent = true })
end

map("gb", require("mn.go.build").build)
