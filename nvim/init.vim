set encoding=utf-8

" There should really be a VIM dir for things executed before, or at least
" some sense of ordering/priority.
for b in split(glob('$XDG_CONFIG_HOME/nvim/before/*'), '\n')
  if filereadable(b)
    execute 'source' b
  endif
endfor

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
