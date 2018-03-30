function! UpdatePlugins() range
  let l:filename='~/.vim/tmp/plugin_snapshot-'.strftime('%Y%m%d-%H%M%S').'.vim'
  echom 'Backing up plugin state to: '.l:filename
  execute 'PlugSnapshot! '.l:filename.' | PlugUpdate | PlugUpgrade'
endf
command! PU :call UpdatePlugins()

" Fattest fingers
" cnoreabbrev W! w!
" cnoreabbrev Q! q!
" cnoreabbrev Wq wq
" cnoreabbrev Wqa wqa
" cnoreabbrev Wa wa
" cnoreabbrev wQ wq
" cnoreabbrev WQ wq
" cnoreabbrev W w
" cnoreabbrev Q q

" cnoremap <C-n> <down>
" cnoremap <C-p> <up>
