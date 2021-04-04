-- local opt = require('options').opt
local opt = vim.opt_local
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

local rt = setup_path()
opt.path = table.concat(rt, ',') .. ',' .. vim.o.path
opt.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
opt.comments = ':---,:--'
