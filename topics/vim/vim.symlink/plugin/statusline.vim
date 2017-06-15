" Status line **********************************************************************************************************
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'

let g:tmuxline_status_justify = 'left'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W #F'],
      \'z'    : '#h'}

