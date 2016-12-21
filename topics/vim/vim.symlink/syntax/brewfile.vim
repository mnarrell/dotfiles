" http://vim.wikia.com/wiki/Creating_your_own_syntax_files

" Vim syntax file
" Language: Homebrew
" Maintainer: Matt Narrell
" Latest Revision: Wed Dec 21 11:41:06 MST 2016

if exists("b:current_syntax")
  finish
endif

" Load ruby syntax
source $VIMRUNTIME/syntax/ruby.vim
unlet b:current_syntax

syn keyword brewfileKeyword brew mas tap appdir
syn match caskKeyword 'cask.* '

hi def link brewfileKeyword Keyword
hi def link caskKeyword Keyword

let b:current_syntax = "brewfile"

