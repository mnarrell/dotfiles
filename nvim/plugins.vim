call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

" Core
" Plug 'ConradIrwin/vim-bracketed-paste'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'          " Fuzzy finding
Plug 'jiangmiao/auto-pairs'                                  " Add closing brace/paren/quote/etc.
Plug 'tpope/vim-commentary'                                  " Comments
Plug 'tpope/vim-eunuch'                                      " Unix commands rename/move/copy
Plug 'tpope/vim-repeat'                                      " Repeat plugin maps
Plug 'tpope/vim-surround'                                    " Manage surrounding braces/quotes/parens
Plug 'tpope/vim-unimpaired'                                  " Pair-wise operators
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' } " Calculate start up time
Plug 'wincent/loupe'                                         " Enhanced in-file search
" Plug 'wincent/terminus'                                      " Enhanced terminal integration

" Navigation
" Plug 'junegunn/vim-easy-align'
" Plug 'majutsushi/tagbar'
Plug 'jlanzarotta/bufexplorer' " Buffer management
Plug 'junegunn/vim-peekaboo'   " Show the register contents
Plug 'markonm/traces.vim'      " Range, pattern and substitute preview
Plug 'tommcdo/vim-lion'        " Alignments
Plug 'tpope/vim-vinegar'       " Netrw for normal people

" Eyecandy
Plug 'chriskempson/base16-vim'        " Color schemes
Plug 'fweep/vim-tabber'               " Like airline for the tab bar
Plug 'kshenoy/vim-signature'          " Display marks in the gutter
Plug 'machakann/vim-highlightedyank'  " Show me what you're yanking
Plug 'vim-airline/vim-airline'        " Statusline eyecandy
Plug 'vim-airline/vim-airline-themes' " Statusline eyecandy

" Text objects
Plug 'christoomey/vim-sort-motion' | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'     | Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'

" Git
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'

" Tmux
" Plug 'edkolev/tmuxline.vim'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' } " Tmux syntax highlighting
Plug 'tmux-plugins/vim-tmux-focus-events'       " Seamless terminal/vim/tmux integration

" Completion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'           " Snippets
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocompletion

" Linting
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' } " Weak LSP client
Plug 'dense-analysis/ale'                                                            " Asynchronous Linting Engine

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax

" Golang
" Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' } " This is the last formal release
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }               " This is the bleeding edge

" Python
Plug 'raimon49/requirements.txt.vim', { 'for': 'requirements' }
" Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
" Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'

" TOML
Plug 'cespare/vim-toml'

" Nginx
"Plug 'chr4/nginx.vim', { 'for': 'nginx' }

" Terraform
Plug 'hashivim/vim-terraform'

" Ansible
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }

" Pandoc
Plug 'vim-pandoc/vim-pandoc', { 'for': 'pandoc' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }

" Helm
Plug 'towolf/vim-helm'

call plug#end()
