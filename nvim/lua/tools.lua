local tools = {}

-- reload a lua module
function tools.reload(fcn) require('plenary.reload').reload_module(fcn) end

-- Convenience func to print Lua tables.
function _G.emit(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

-- Create dictionary keys for embedded functions.
function tools.escape_keymap(key) return 'k' .. key:gsub('.', string.byte) end

-- Support function for various mode mappings.
local mapper = function(mode, lhs, rhs, opts)
  local options = vim.tbl_extend('force', {noremap = false, silent = true}, opts or {})

  if options.buffer then -- buffer local
      options.buffer = nil
      local bufnr = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
    else -- global
      vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end
end

local map = {noremap = false, silent = true}
local noremap = {noremap = true, silent = true}

tools.nmap = function(lhs, rhs, opts)
  local options = vim.tbl_extend('force', map, opts or {})
  mapper('n', lhs, rhs, options)
end

tools.nnoremap = function(lhs, rhs, opts)
  local options = vim.tbl_extend('force', noremap, opts or {})
  mapper('n', lhs, rhs, options)
end

tools.xnoremap = function(lhs, rhs, opts)
  local options = vim.tbl_extend('force', noremap, opts or {})
  mapper('x', lhs, rhs, options)
end

tools.inoremap = function(lhs, rhs, opts)
  local options = vim.tbl_extend('force', noremap, opts or {})
  mapper('i', lhs, rhs, options)
end

tools.imap = function(lhs, rhs, opts)
  local options = vim.tbl_extend('force', map, opts or {})
  mapper('i', lhs, rhs, options)
end

tools.onoremap = function(lhs, rhs, opts)
  local options = vim.tbl_extend('force', noremap, opts or {})
  mapper('o', lhs, rhs, options)
end

tools.tnoremap = function(lhs, rhs, opts)
  local options = vim.tbl_extend('force', noremap, opts or {})
  mapper('t', lhs, rhs, options)
end

tools.tmap = function(lhs, rhs, opts)
  local options = vim.tbl_extend('force', map, opts or {})
  mapper('t', lhs, rhs, options)
end

tools.vnoremap = function(lhs, rhs, opts)
  local options = vim.tbl_extend('force', noremap, opts or {})
  mapper('v', lhs, rhs, options)
end

tools.vmap = function(lhs, rhs, opts)
  local options = vim.tbl_extend('force', map, opts or {})
  mapper('v', lhs, rhs, options)
end

-- Convenience functions Lua lacks...
function string.startswith(self, str) return self:sub(1, #str) == str end
function string.endswith(self, str) return self:sub(-#str) == str end

-- Create the backup/swap/undo directories
function tools.create_backup_dirs()
  local env = require('env')
  local path = require('plenary').path
  local dirs = {env.backup_dir, env.swap_dir, env.undo_dir}

  for _, dir in pairs(dirs) do
    local p = path:new(dir)
    if not p:exists() then p:mkdir() end
  end
end

return tools
