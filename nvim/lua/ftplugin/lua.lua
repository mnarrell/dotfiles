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

-- M = {}
-- function M.include_expr(filename)
--   local to_search

--   if not filename then
--     local line = vim.fn.getline('.')
--     local result = string.match(line, [[require%('(.*)'%)]])
--     to_search = result
--   else
--     to_search = filename
--   end

--   -- print(package.path)
--   -- print(package.cpath)

--   local found = package.searchpath(to_search, package.path)
--   print(string.format("found - %s", found))
--   if not found then
--     found = package.searchpath(to_search, package.cpath)
--     print(string.format("found - %s", found))
--   end

--   return found or ""
-- end

return function()
  local rt = setup_path()
  vim.bo.path = table.concat(rt, ',') .. ',' .. vim.o.path
  vim.bo.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
  -- vim.bo.includeexpr = [[v:lua.blargh.include_expr(v:fname)]]
  -- vim.bo.includeexpr = [[v:lua.ftplugin.lua_expr(v:fname)]]
  vim.bo.comments = ':---,:--'
end

