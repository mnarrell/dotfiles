call plug#begin('$XDG_CONFIG_HOME/vim/plugged')

" Core
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Navigation
" Plug 'fweep/vim-tabber'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
" Plug 'majutsushi/tagbar'
Plug 'markonm/traces.vim'
Plug 'tpope/vim-vinegar'

" Eyecandy
Plug 'chriskempson/base16-vim'
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

call plug#end()
