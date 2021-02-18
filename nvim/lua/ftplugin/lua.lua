local env = require('env')

local function setup_path()
  local result = {}
  for _,path in pairs(vim.api.nvim_list_runtime_paths()) do
    local lua_path = path .. '/lua/'
    if vim.fn.isdirectory(lua_path) then
      table.insert(result, lua_path)
    end
  end

  table.insert(result, vim.fn.expand('$VIMRUNTIME/lua'))
  table.insert(result, vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'))
  table.insert(result, vim.fn.expand(env.home .. '/src/neovim/src/nvim/lua'))

  return result
end

return function()
  local rt = setup_path()
  vim.bo.path = table.concat(rt, ',') .. ',' .. vim.o.path
  vim.bo.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
  vim.bo.comments = ':---,:--'
end

