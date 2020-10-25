local tools = {}

-- reload a lua module
function tools.reload(fcn) require('plenary.reload').reload_module(fcn) end

-- Convenience func to print Lua tables.
function tools.emit(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

-- Create dictionary keys for embedded functions.
function tools.escape_keymap(key) return 'k' .. key:gsub('.', string.byte) end

-- Create a table of autocmds. Supports embedded functions.
function tools.create_autocmds(definitions)
  for group, def in pairs(definitions) do
    vim.api.nvim_command('augroup ' .. group)
    vim.api.nvim_command('autocmd!')
    for _, cmd in ipairs(def) do
      if type(cmd[3]) == 'function' then
        local key = tools.escape_keymap(cmd[1] .. cmd[2]) -- TODO: is this unique enough?
        AUTOCMDS[key] = cmd[3]
        cmd[3] = ('lua AUTOCMDS.%s()'):format(key)
      end

      cmd = table.concat(vim.tbl_flatten {'autocmd', cmd}, ' ')
      -- print(cmd)
      vim.api.nvim_command(cmd)
    end
    vim.api.nvim_command('augroup END')
  end
end

local function ensure_buf_mapping_cache(bufnr)
  if not BUFFER_KEYMAPS[bufnr] then
    BUFFER_KEYMAPS[bufnr] = {}
    vim.api.nvim_buf_attach(bufnr, false, {
      on_detach = function() BUFFER_KEYMAPS[bufnr] = nil end
    })
  end
end

-- bind key chords to commands and functions, globally and per buffer.
function tools.apply_mappings(maps, default_options)
  local current_bufnr = vim.api.nvim_get_current_buf()

  for _, entry in pairs(maps) do
    local mode = entry[1]
    local lhs = entry[2]
    local rhs = entry[3]
    local options =
      vim.tbl_extend('keep', entry[4] or {}, default_options or {})

    -- Im guessing this allows to specify a buffer to update? dunno if i'd
    -- ever need this?
    local bufnr = current_bufnr
    if type(options.buffer) == 'number' and options.buffer ~= 0 then
      bufnr = options.buffer
    end

    -- funcs
    if type(rhs) == 'function' then
      local key = tools.escape_keymap(lhs)

      if options.buffer then
        ensure_buf_mapping_cache(bufnr)
        BUFFER_KEYMAPS[bufnr][key] = rhs
        rhs = ('<Cmd>lua BUFFER_KEYMAPS[%d].%s()<CR>'):format(bufnr, key)
      else -- global mapping
        KEYMAPS[key] = rhs
        rhs = ('<Cmd>lua KEYMAPS.%s()<CR>'):format(key)
      end
    end

    -- Check if needed
    if string.find(rhs, '<Plug>') then options.noremap = nil end

    if options.buffer then -- buflocal?
      options.buffer = nil
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
    else -- global?
      vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end
  end
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
