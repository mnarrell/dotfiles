-- local env = require('env')
-- local library = {}
-- local path = vim.split(package.path, ';')

-- table.insert(path, 'lua/?.lua')
-- table.insert(path, 'lua/?/init.lua')

-- local add = function(lib)
--   for _, p in pairs(vim.fn.expand(lib, false, true)) do
--     p = vim.loop.fs_realpath(p)
--     library[p] = true
--   end
-- end

-- -- add runtime
-- add('$VIMRUNTIME')

-- -- add your config
-- add('~/.config/nvim')

-- -- add plugins
-- add('~/.local/share/nvim/site/pack/packer/opt/*')
-- add('~/.local/share/nvim/site/pack/packer/start/*')

-- return function(custom_attach)
--   local sumneko_root = env.home .. '/src/lua-language-server'
--   local sumneko_bin = sumneko_root .. '/bin/macOS/lua-language-server'

--   return {
--     cmd = {sumneko_bin, '-E', sumneko_root .. '/main.lua'},
--     on_attach = custom_attach,
--     on_new_config = function(config, root)
--       local libs = vim.tbl_deep_extend('force', {}, library)
--       libs[root] = nil
--       config.settings.Lua.workspace.library = libs
--       return config
--     end,
--     settings = {
--       Lua = {
--         runtime = {
--           -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--           version = 'LuaJIT',
--           -- Setup your lua path
--           path = path
--         },
--         completion = {callSnippet = 'Both'},
--         diagnostics = {
--           -- Get the language server to recognize the `vim` global
--           globals = {'vim'}
--         },
--         workspace = {
--           -- Make the server aware of Neovim runtime files
--           library = library,
--           maxPreload = 2000,
--           preloadFileSize = 50000
--         },
--         -- Do not send telemetry data containing a randomized but unique identifier
--         telemetry = {enable = false}
--       }
--     }
--   }
-- end

local M = {}

M.setup = function(lspconfig, custom_attach)
  local sumneko_root = vim.env.HOME .. '/src/lua-language-server'
  local sumneko_bin = sumneko_root .. '/bin/macOS/lua-language-server'
  local luadev = require("lua-dev").setup({
    library = {
      plugins = false,
    },
    lspconfig = {
      on_attach = custom_attach,
      cmd = {sumneko_bin, '-E', sumneko_root .. '/main.lua'},
      settings = {
        Lua = {
          workspace = {
            preloadFileSize = 50000
          },
        },
      },
    }
  })
  lspconfig.sumneko_lua.setup(luadev)
end

return M
