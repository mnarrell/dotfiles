local xdg_data_home = os.getenv('XDG_DATA_HOME')
local xdg_cache_home = os.getenv('XDG_CACHE_HOME')
local xdg_config_home = os.getenv('XDG_CONFIG_HOME')
local xdg_runtime_dir = os.getenv('XDG_RUNTIME_DIR')

-- Registries for binding functions
AUTOCMDS = {}
KEYMAPS = {}
BUFFER_KEYMAPS = {}

return {
  home = os.getenv('HOME'),
  dots = os.getenv('DOTFILES') or os.getenv('HOME') .. '/.dotfiles',

  xdg_data_home   = xdg_data_home,
  xdg_cache_home  = xdg_cache_home,
  xdg_config_home = xdg_config_home,
  xdg_runtime_dir = xdg_runtime_dir,

  backup_dir = xdg_data_home .. '/nvim/backup',
  swap_dir   = xdg_data_home .. '/nvim/swap',
  undo_dir   = xdg_data_home .. '/nvim/undo'
}
