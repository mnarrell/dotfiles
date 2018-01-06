" Eyecandy ************************************************************************************************************
syntax on
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace

if filereadable(expand("$HOME/.vimrc_background"))
  source $HOME/.vimrc_background
endif
