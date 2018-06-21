" Eyecandy ************************************************************************************************************
syntax on
set background=dark
let g:base16colorspace=256  " Access colors present in 256 colorspace

if filereadable(expand('$HOME/.vimrc_background'))
  source $HOME/.vimrc_background
endif

hi clear SpellBad
hi SpellBad cterm=underline,bold

hi clear Search
hi Search ctermfg=Red ctermbg=NONE cterm=underline
hi IncSearch ctermfg=White ctermbg=Red cterm=bold

hi Pmenu ctermbg=white ctermfg=black
hi PmenuSbar ctermbg=grey ctermfg=grey
hi PmenuSel ctermbg=4 ctermfg=18 cterm=bold
hi PmenuThumb ctermbg=4 ctermfg=4
