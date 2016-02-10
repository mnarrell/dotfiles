set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'L9'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'corntrace/bufexplorer'
Plug 'kien/ctrlp.vim'
Plug 'fweep/vim-tabber'
Plug 'sjl/gundo.vim'

Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

Plug 'scrooloose/nerdcommenter'
Plug 'sukima/xmledit'
Plug 'derekwyatt/vim-scala'
" Plug 'rodjek/vim-puppet'
Plug 'lepture/vim-jinja'
Plug 'scrooloose/syntastic'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

call plug#end()
