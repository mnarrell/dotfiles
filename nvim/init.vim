set encoding=utf-8

" Load the plugins
source ${XDG_CONFIG_HOME}/nvim/plugins.vim

let g:mapleader = "\<Space>"
let g:maplocalleader="\\"

filetype indent plugin on
if !exists('g:syntax_on')
  syntax enable
endif

let s:vimrc_local = $XDG_CONFIG_HOME . '/nvim/local.vim'
if filereadable(s:vimrc_local)
  execute 'source ' . s:vimrc_local
endif
