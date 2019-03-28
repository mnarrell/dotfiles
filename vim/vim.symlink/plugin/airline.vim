" Status line **********************************************************************************************************
set laststatus=2

let g:airline_extensions = ['branch', 'whitespace', 'ale']
if exists(':Tmuxline')
  let g:airline_extensions += 'tmuxline'
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'base16'

