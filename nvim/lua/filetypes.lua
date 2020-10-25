local tools = require('tools')

FILETYPE_HOOKS = {
  dockerfile = require('ftplugin.dockerfile'),
  gitcommit  = require('ftplugin.gitcommit'),
  gitconfig  = require('ftplugin.gitconfig'),
  go         = require('ftplugin.go'),
  gomod      = require('ftplugin.gomod'),
  -- lua        = require('ftplugin.lua').options(),
  lua        = require('ftplugin.lua'),
  make       = require('ftplugin.make'),
  markdown   = require('ftplugin.markdown'),
  python     = require('ftplugin.python'),
  qf         = require('ftplugin.qf'),
  sh         = require('ftplugin.sh'),
  xml        = require('ftplugin.xml'),
  yaml       = require('ftplugin.yaml'),
}

local autocmds = {}
for ft,_ in pairs(FILETYPE_HOOKS) do
  autocmds["LuaFileTypeHook_" .. tools.escape_keymap(ft)] = {
    {"FileType", ft, string.format("lua FILETYPE_HOOKS[%q]()", ft)}
  }
end

tools.create_autocmds(autocmds)
