-- local history = function(earlier)
--   return function()
--     local winnr = vim.api.nvim_eval("winnr()")
--     local win_info = vim.tbl_filter(function(item)
--       return item.winnr == winnr
--     end, vim.api.nvim_eval("getwininfo()"))
--
--     local lt = win_info.loclist and "l" or "c"
--     local dir = earlier and "newer" or "older"
--     vim.api.nvim_command(lt .. dir)
--   end
-- end
--
-- local map = function(lhs, rhs)
--   vim.keymap.set("n", lhs, rhs, { silent = true })
-- end
--
-- map("<left>", function()
--   history(false)
-- end)
--
-- map("<right>", function()
--   history(true)
-- end)

-- Some settings.
vim.wo.nu = true
vim.wo.rnu = true
vim.opt_local.list = false
vim.o.buflisted = false

-- Add the cfilter plugin.
-- vim.cmd.packadd 'cfilter'
