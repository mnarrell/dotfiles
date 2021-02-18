local M = {}

local opts_info = vim.api.nvim_get_all_options_info()
M.opt = setmetatable({}, {
  __index = vim.o,
  __newindex = function(_, k, v)
    vim.o[k] = v
    local scope = opts_info[k].scope
    if scope == 'win' then
      vim.wo[k] = v
    elseif scope == 'buf' then
      vim.bo[k] = v
    end
  end
})

function M.set_globals()
  vim.g.mapleader = ' '
  vim.g.python3_host_prog = '/usr/local/opt/python@3.9/libexec/bin/python'

  -- netrw oddities
  vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'
  vim.g.netrw_silent = 1
  vim.g.vimsyn_embed = 'l'

  -- o.number                                     -- Show the current line number in the gutter
  -- o.wildchar =[[<C-z>]]                        -- substitute for 'wildchar' (<Tab>) in macros

  -- TODO: investigate this
  ----Incremental live completion
  --vim.o.inccommand = "nosplit"
  ----Set highlight on search
  --vim.o.hlsearch = false
  --vim.o.incsearch = true

  M.opt.linebreak = true

  -- TODO: Colored Telescope DevIcons
  M.opt.termguicolors = true
  M.opt.background = 'dark'

  M.opt.linebreak = true -- wrap long lines at characters in 'breakat'
  M.opt.number = true -- show line number
  M.opt.relativenumber = true -- show relative numbers in gutter
  M.opt.signcolumn = 'yes' -- Always show the gutter
  M.opt.wrap = false -- Do not wrap lines by default

  M.opt.autoindent = true -- Retain indents when moving to new line
  M.opt.backspace = 'indent,eol,start' -- Make the backspace key sane
  M.opt.clipboard = 'unnamed,unnamedplus' -- use the system clipboards
  M.opt.cmdwinheight = 20 -- Make the command window height more tolerable
  M.opt.complete = '.,b,k,kspell' -- Where to find completion candidates
  M.opt.copyindent = true -- Copy the structure of the indent
  M.opt.diffopt = M.opt.diffopt .. ',vertical' -- Always use vertical diffs
  M.opt.encoding = 'UTF-8'
  M.opt.expandtab = true -- Insert spaces as the tab characters
  M.opt.fileformat = 'unix' -- UNIX EOL characters
  M.opt.hidden = true -- allow for unsaved buffers in the background
  M.opt.joinspaces = false -- Use one space, not two, after eunctuation.
  M.opt.list = true -- show whitespace
  M.opt.modeline = false -- Don't allow text to manipulate the editor
  M.opt.mouse = 'a' -- allow the mouse in all modes
  M.opt.scrolloff = 3 -- start scrolling 3 lines before edge of viewport
  M.opt.shell = '/usr/local/bin/zsh' -- ZSH
  M.opt.shiftround = true -- always indent by multiple of shiftwidth
  M.opt.shiftwidth = 2 -- spaces per tab (when shifting)
  M.opt.showbreak = '⤷ ' -- line wrap indicator
  M.opt.showcmd = false -- don't show extra info at end of command line
  M.opt.showmatch = true -- Show matching braces, parens, etc.
  M.opt.showmode = false -- Don't show mode (because of statusline)
  M.opt.sidescrolloff = 3 -- same as scrolloff, but for columns
  M.opt.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace
  M.opt.splitbelow = true -- open horizontal splits below current window
  M.opt.splitright = true -- open vertical splits to the right of the current window
  M.opt.switchbuf = 'usetab' -- try to reuse windows/tabs when switching buffers
  M.opt.textwidth = 120 -- 80 is for the weak
  M.opt.undolevels = 1000 -- Undo memory size
  M.opt.updatecount = 80 -- update swapfiles every 80 typed chars
  M.opt.updatetime = 250
  M.opt.virtualedit = 'block' -- allow cursor to move where there is no text in visual block mode
  M.opt.visualbell = true -- stop annoying beeping for non error errors
  M.opt.whichwrap = [[b,h,l,s,<,>,[,],~]] -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
  M.opt.wildignore = '*/.git,tmp/backup,*/tmp/swap' -- patterns to ignore during file navigation
  M.opt.wildmode = 'longest:full,full' -- shell like autocomplete to unambiguous portion

  M.opt.completeopt = 'menuone,noinsert,noselect'
  -- M.opt.completeopt = "menu,noselect"
  -- M.opt.completeopt = "menu"

  M.opt.formatprg = 'par -w120rq'
  M.opt.grepprg = 'rg --vimgrep --no-heading'
  M.opt.listchars = 'nbsp:⦸,tab:▷┅,extends:»,precedes:«,trail:•'

  M.opt.shortmess = M.opt.shortmess .. 'c' -- don't give |ins-completion-menu| messages
  M.opt.shortmess = M.opt.shortmess .. 'A' -- ignore annoying swapfile messages
  M.opt.shortmess = M.opt.shortmess .. 'I' -- no splash screen
  M.opt.shortmess = M.opt.shortmess .. 'W' -- don't echo " [w] " / " [written] " when writing
  M.opt.shortmess = M.opt.shortmess .. 'a' -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`

  -- dont make backups if sudo'd
  if os.getenv('SUDO_USER') then
    M.opt.backup = false
    M.opt.writebackup = false
    M.opt.swapfile = false
  else
    local env = require('env')
    M.opt.backup = true
    M.opt.backupdir = env.backup_dir
    M.opt.undofile = true
    M.opt.undodir = env.undo_dir
    M.opt.directory = env.swap_dir
  end
end

return M
