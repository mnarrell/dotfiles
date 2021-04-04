local nnoremap= require('tools').nnoremap

local M= {}

M.history =function(earlier)
  return function()
    local winnr = vim.api.nvim_eval('winnr()')
    local win_info = vim.tbl_filter(function(item)
      return item.winnr == winnr
    end, vim.api.nvim_eval('getwininfo()'))
    -- require('tools').emit(nt)

    local lt = win_info.loclist and 'l' or 'c'
    local dir = earlier and 'newer' or 'older'
    vim.api.nvim_command(lt .. dir)
  end
end

nnoremap('<left>', [[:lua require('ftplugin.qf').history(false)<CR>]])
nnoremap('<right>', [[:lua require('ftplugin.qf').history(true)<CR>]])

return M
