call plug#begin('$XDG_CONFIG_HOME/vim/plugged')

" Core
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'wincent/loupe'
Plug 'wincent/terminus'

" Navigation
Plug 'fweep/vim-tabber'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'majutsushi/tagbar'
Plug 'markonm/traces.vim'
Plug 'tpope/vim-vinegar'

" Eyecandy
Plug 'chriskempson/base16-vim'
Plug 'kshenoy/vim-signature'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Text objects
" Plug 'kana/vim-textobj-line'       | Plug 'kana/vim-textobj-user'
Plug 'christoomey/vim-sort-motion' | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'     | Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'

" Git
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Tmux
" Plug 'edkolev/tmuxline.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'tmux-plugins/vim-tmux-focus-events'

" Completion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Linting
Plug 'w0rp/ale'

" Syntax
Plug 'cespare/vim-toml'
Plug 'chr4/nginx.vim', { 'for': 'nginx' }
" Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'vim-pandoc/vim-pandoc', { 'for': 'pandoc' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }
Plug 'dylon/vim-antlr'

call plug#end()
