local arrows = require("icons").arrows

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.python3_host_prog = vim.env.XDG_CONFIG_HOME .. "/nvim/.venv/bin/python"
vim.g.ruby_host_prog = vim.env.XDG_DATA_HOME .. "/asdf/shims/ruby"
vim.g.loaded_perl_provider = 0
vim.g.vimsyn_embed = "l" -- highlight inline Lua

-- netrw oddities
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"
vim.g.netrw_silent = 1

vim.o.termguicolors = true

vim.o.linebreak = true -- wrap long lines at characters in 'breakat'
vim.o.number = true -- show line number
vim.o.relativenumber = true -- show relative numbers in gutter
vim.o.signcolumn = "yes" -- Always show the gutter
vim.o.wrap = false -- Do not wrap lines by default

vim.o.backspace = "indent,eol,start" -- Make the backspace key sane
vim.o.breakindent = true -- wrapped lines have same indent level
vim.o.clipboard = "unnamed,unnamedplus" -- use the system clipboards
vim.o.cmdwinheight = 20 -- Make the command window height more tolerable
vim.o.complete = ".,b,k,kspell" -- Where to find completion candidates
vim.o.copyindent = true -- Copy the structure of the indent
-- vim.o.diffopt:append(",vertical")
vim.o.expandtab = true -- Insert spaces as the tab characters
vim.o.fileformat = "unix" -- UNIX EOL characters
vim.o.hidden = true -- allow for unsaved buffers in the background
vim.o.joinspaces = false -- Use one space, not two, after eunctuation.
vim.o.linebreak = true -- Wrap long lines at a character in 'breakat'
-- vim.o.list = true -- show whitespace
vim.o.modeline = false -- Don't allow text to manipulate the editor
vim.o.mouse = "a" -- allow the mouse in all modes
vim.o.scrolloff = 10 -- start scrolling 3 lines before edge of viewport
vim.o.shell = "/opt/homebrew/bin/zsh" -- ZSH
vim.o.shiftround = true -- always indent by multiple of shiftwidth
vim.o.shiftwidth = 2 -- spaces per tab (when shifting)
vim.o.showbreak = "⤷ " -- line wrap indicator
vim.o.showcmd = false -- don't show extra info at end of command line
vim.o.showmatch = true -- Show matching braces, parens, etc.
vim.o.showmode = false -- Don't show mode (because of statusline)
vim.o.sidescrolloff = 3 -- same as scrolloff, but for columns
vim.o.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace
vim.o.splitbelow = true -- open horizontal splits below current window
vim.o.splitright = true -- open vertical splits to the right of the current window
vim.o.switchbuf = "usetab" -- try to reuse windows/tabs when switching buffers
vim.o.textwidth = 120 -- 80 is for the weak
vim.o.timeoutlen = 300 --time in milliseconds to wait for a mapped sequence to complete.
vim.o.undolevels = 1000 -- Undo memory size
vim.o.updatecount = 80 -- update swapfiles every 80 typed chars
vim.o.updatetime = 250 -- millis to trigger CursorHold and swap file writes
vim.o.virtualedit = "block" -- allow cursor to move where there is no text in visual block mode
vim.o.visualbell = true -- stop annoying beeping for non error errors
vim.o.whichwrap = [[b,h,l,s,<,>,[,],~]] -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
vim.o.wildignore = "*/.git,tmp/backup,*/tmp/swap" -- patterns to ignore during file navigation
vim.o.wildmode = "longest:full,full" -- shell like autocomplete to unambiguous portion

-- Folding
vim.o.foldlevelstart = 99 -- open all folds by default
-- vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.o.foldcolumn = "0"
vim.opt.fillchars = {
  diff = "╱",
  eob = " ", -- suppress ~ at EndOfBuffer
  fold = " ",
  foldclose = arrows.right,
  foldopen = arrows.down,
  foldsep = " ", -- separator between folds
  msgsep = "‾", -- separator between messages
  vert = "|",
}

vim.opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "context:12",
  "algorithm:histogram",
  "linematch:200",
  "indent-heuristic",
}

vim.o.completeopt = "menu,menuone,noselect"
-- vim.o.completeopt = "menuone,noinsert,noselect"

vim.o.formatprg = "par -w78rs"
-- vim.o.formatprg = 'par -w120rq'

vim.o.grepprg = "rg --vimgrep --no-heading --smart-case --hidden"
vim.o.grepformat = "%f:%l:%c:%m"

-- vim.o.listchars = "nbsp:⦸,tab:▷┅,extends:»,precedes:«,trail:•"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- vim.opt.shortmess = vim.o.shortmess .. 'c' -- don't give |ins-completion-menu| messages
vim.opt.shortmess:append("c")
vim.opt.shortmess:append("A")
vim.opt.shortmess:append("I")
vim.opt.shortmess:append("W")
vim.opt.shortmess:append("a")

vim.opt.backupdir:remove(".")
vim.opt.undodir:remove(".")
vim.opt.directory:remove(".")

-- dont make backups if sudo'd
if vim.env.SUDO_USER then
  vim.o.backup = false
  vim.o.writebackup = false
  vim.o.swapfile = false
else
  vim.o.backup = true
  vim.o.undofile = true
end
