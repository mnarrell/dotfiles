set nocompatible    " Don't sacrifice anything for Vi compatibility.
set encoding=utf-8  " In case $LANG doesn't have a sensible value.

" pathogem.vim lets us keep plugins etc in their own folders under ~/.vim/bundle.
" http://www.vim.org/scripts/script.php?script_id=2332
" filetype off and then on again afterwards for ftdetect files to work properly.
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on  " Load plugin and indent settings for the detected filetype.
syntax on                  " Syntax highlighting.
color blackboard           " Default color scheme.
set number                 " Show gutter with line numbers.
set ruler                  " Show line, column and scroll info in status line.
set laststatus=2           " Always show status bar.
set modelines=1            " Use modeline overrides.
set showcmd                " Show partially typed command sequences.
set scrolloff=3            " Minimal number of lines to always show above/below the caret.

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Save a file as root.
cabbrev w!! w !sudo tee % > /dev/null<CR>:e!<CR><CR>

" NERDTree config
let NERDTreeIgnore=['\.rbc$', '\~$']
let g:NERDMenuMode=0

" NERDCommenter
let g:NERDCreateDefaultMappings=0
map <leader>c <Plug>NERDCommenterToggle

" Command-T config
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop=1
