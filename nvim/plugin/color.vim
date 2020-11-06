" Eyecandy ************************************************************************************************************
syntax on
set background=dark
let g:base16colorspace=256  " Access colors present in 256 colorspace

if filereadable(expand('$HOME/.vimrc_background'))
  source $HOME/.vimrc_background
endif

" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f

hi clear SpellBad
hi clear Search

hi HighlightedyankRegion ctermbg=Blue
hi IncSearch             ctermfg=White ctermbg=Red  cterm=bold
hi Pmenu                 ctermbg=18
hi PmenuSbar             ctermbg=18
hi PmenuSel              ctermbg=Blue  cterm=bold
hi PmenuThumb            ctermbg=Blue
hi Search                ctermfg=Red   ctermbg=NONE cterm=underline
hi SpellBad              cterm=underline,bold

hi CursorLineNr          ctermfg=Blue  cterm=bold
