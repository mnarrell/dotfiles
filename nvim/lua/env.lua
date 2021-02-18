local xdg_data_home = vim.env.XDG_DATA_HOME
local xdg_cache_home = vim.env.XDG_CACHE_HOME
local xdg_config_home = vim.env.XDG_CONFIG_HOME
local xdg_runtime_dir = vim.env.XDG_RUNTIME_DIR

-- Registries for binding functions
AUTOCMDS = {}
KEYMAPS = {}
BUFFER_KEYMAPS = {}

return {
  home = vim.env.HOME,
  dots = vim.env.DOTFILES or vim.env.HOME .. '/.dotfiles',

  xdg_data_home   = xdg_data_home,
  xdg_cache_home  = xdg_cache_home,
  xdg_config_home = xdg_config_home,
  xdg_runtime_dir = xdg_runtime_dir,

  backup_dir = xdg_data_home .. '/nvim/backup',
  swap_dir   = xdg_data_home .. '/nvim/swap',
  undo_dir   = xdg_data_home .. '/nvim/undo'
}
