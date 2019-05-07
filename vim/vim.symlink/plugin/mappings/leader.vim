nnoremap <silent> <Leader>o :only<CR>
nnoremap <silent> <Leader>q :quit<CR>
nnoremap <silent> <Leader>w :write<CR>
nnoremap <silent> <Leader>x :xit<CR>

nnoremap <silent> <leader>l :call functions#ToggleLocationList()<CR>
nnoremap <silent> <leader>c :call functions#ToggleQuickFix()<CR>

" Do the splits
nnoremap <leader>v :vsp<cr>
nnoremap <leader>s :sp<cr>

" Takes a register (or * by default) and opens it in the cmdline-window.
" Hit <cr> when you're done editing for setting the register.
" nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Redraw the screen
" nnoremap <leader>r :redraw!<CR>

" Adds markdown headers
nnoremap <leader>1 m`^i# <esc>``2l
nnoremap <leader>2 m`^i## <esc>``3l
nnoremap <leader>3 m`^i### <esc>``4l
nnoremap <leader>4 m`^i#### <esc>``5l
nnoremap <leader>5 m`^i##### <esc>``6l
