vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.python3_host_prog = vim.fn.expand("$XDG_DATA_HOME/venvs/neovim/bin/python")
vim.g.ruby_host_prog = vim.fn.expand("$XDG_DATA_HOME/gem/bin/neovim-ruby-host")
vim.g.vimsyn_embed = "l" -- highlight inline Lua

-- netrw oddities
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"
vim.g.netrw_silent = 1

vim.opt.termguicolors = true

vim.opt.linebreak = true -- wrap long lines at characters in 'breakat'
vim.opt.number = true -- show line number
vim.opt.relativenumber = true -- show relative numbers in gutter
vim.opt.signcolumn = "yes" -- Always show the gutter
vim.opt.wrap = false -- Do not wrap lines by default

vim.opt.backspace = "indent,eol,start" -- Make the backspace key sane
vim.opt.breakindent = true -- wrapped lines have same indent level
vim.opt.clipboard = "unnamed,unnamedplus" -- use the system clipboards
vim.opt.cmdwinheight = 20 -- Make the command window height more tolerable
vim.opt.complete = ".,b,k,kspell" -- Where to find completion candidates
vim.opt.copyindent = true -- Copy the structure of the indent
vim.opt.diffopt:append(",vertical")
vim.opt.expandtab = true -- Insert spaces as the tab characters
vim.opt.fileformat = "unix" -- UNIX EOL characters
vim.opt.foldlevelstart = 100 -- open all folds by default
vim.opt.hidden = true -- allow for unsaved buffers in the background
vim.opt.joinspaces = false -- Use one space, not two, after eunctuation.
vim.opt.linebreak = true -- Wrap long lines at a character in 'breakat'
-- vim.opt.list = true -- show whitespace
vim.opt.modeline = false -- Don't allow text to manipulate the editor
vim.opt.mouse = "a" -- allow the mouse in all modes
vim.opt.scrolloff = 10 -- start scrolling 3 lines before edge of viewport
vim.opt.shell = "/opt/homebrew/bin/zsh" -- ZSH
vim.opt.shiftround = true -- always indent by multiple of shiftwidth
vim.opt.shiftwidth = 2 -- spaces per tab (when shifting)
vim.opt.showbreak = "⤷ " -- line wrap indicator
vim.opt.showcmd = false -- don't show extra info at end of command line
vim.opt.showmatch = true -- Show matching braces, parens, etc.
vim.opt.showmode = false -- Don't show mode (because of statusline)
vim.opt.sidescrolloff = 3 -- same as scrolloff, but for columns
vim.opt.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace
vim.opt.splitbelow = true -- open horizontal splits below current window
vim.opt.splitright = true -- open vertical splits to the right of the current window
vim.opt.switchbuf = "usetab" -- try to reuse windows/tabs when switching buffers
vim.opt.textwidth = 120 -- 80 is for the weak
vim.opt.timeoutlen = 300 --time in milliseconds to wait for a mapped sequence to complete.
vim.opt.undolevels = 1000 -- Undo memory size
vim.opt.updatecount = 80 -- update swapfiles every 80 typed chars
vim.opt.updatetime = 250 -- millis to trigger CursorHold and swap file writes
vim.opt.virtualedit = "block" -- allow cursor to move where there is no text in visual block mode
vim.opt.visualbell = true -- stop annoying beeping for non error errors
vim.opt.whichwrap = [[b,h,l,s,<,>,[,],~]] -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
vim.opt.wildignore = "*/.git,tmp/backup,*/tmp/swap" -- patterns to ignore during file navigation
vim.opt.wildmode = "longest:full,full" -- shell like autocomplete to unambiguous portion

vim.opt.completeopt = "menuone,noinsert,noselect"
-- vim.opt.completeopt = "menu,noselect"
-- vim.opt.completeopt = "menu"

vim.opt.formatprg = "par -w78rs"
-- vim.opt.formatprg = 'par -w120rq'

vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case --hidden"
vim.o.grepformat = "%f:%l:%c:%m"

-- vim.opt.listchars = "nbsp:⦸,tab:▷┅,extends:»,precedes:«,trail:•"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.fillchars:append("fold: ")
vim.opt.fillchars:append("vert:|")
vim.opt.fillchars:append("diff: ")

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
  vim.opt.backup = false
  vim.opt.writebackup = false
  vim.opt.swapfile = false
else
  vim.opt.backup = true
  vim.opt.undofile = true
end
