local function history(earlier)
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

return function()
  require('tools').apply_mappings({
    {'n', '<left>', history(false)},
    {'n', '<right>', history(true)},
  }, {noremap = true, silent = true})
end
