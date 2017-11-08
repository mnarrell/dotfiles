set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'wincent/loupe'                            " Better in-file search
Plug 'wincent/terminus'                         " Make terminal VIM work like a real app

" Core
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Tmux Integration
Plug 'benmills/vimux'
Plug 'jgdavey/tslime.vim'                       " Send selected text to a tmux pane
Plug 'keith/tmux.vim', { 'for': 'tmux' }

" Navigation
Plug 'Xuyuanp/nerdtree-git-plugin'  | Plug 'scrooloose/nerdtree'
Plug 'fweep/vim-tabber'
Plug 'mbbill/undotree'
Plug 'tpope/vim-vinegar'

" Eyecandy
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim', { 'for': [] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Text objects
Plug 'christoomey/vim-sort-motion'  | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'      | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'        | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-user'

" Git things
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" Linting
Plug 'w0rp/ale'

" Completion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
endif

" GO
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
if has('nvim')
  Plug 'zchee/deoplete-go', { 'do': 'make' }
endif

" PostgreSQL
Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }

" JSON
Plug 'elzr/vim-json', { 'for': 'json' }

" Lua
" Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' }
" Plug 'xolox/vim-lua-inspect', { 'for': 'lua' }

" Python
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'raimon49/requirements.txt.vim', { 'for': 'requirements' }
" if has('nvim')
"   Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" endif

" Docker
Plug 'ekalinin/Dockerfile.vim'

call plug#end()
