let g:mapleader = "\<Space>"

filetype indent on      " activates indenting for files
syntax on               " syntax highlighting

set autoindent          " Indent according to previous line.
set backspace=2         " backspace in insert mode works like normal editor
set shiftwidth=2        " indent by 2 spaces when auto-indenting
set softtabstop=2       " indent by 2 spaces when hitting tab
set autoindent          " auto indenting
set number              " line numbers
set relativenumber      " relative line numbers
set nobackup            " get rid of anoying ~file

nnoremap <silent> <Leader>o :only<CR>
nnoremap <silent> <Leader>q :quit<CR>
nnoremap <silent> <Leader>w :write<CR>
nnoremap <silent> <Leader>x :xit<CR>
nnoremap <silent> <Leader>v :vsp<cr>
nnoremap <silent> <Leader>s :sp<cr>
nnoremap <silent> <Leader>k :bd!<CR>

nnoremap <silent> - :Explore<CR>
