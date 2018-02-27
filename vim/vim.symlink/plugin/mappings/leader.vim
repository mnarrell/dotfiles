" Zap trailing whitespace in the current buffer.
nnoremap <silent> <Leader>zz :call functions#Preserve('%s/\v\s+$//e')<CR>

nnoremap <silent> <Leader>o :only<CR>
nnoremap <silent> <Leader>q :quit<CR>
nnoremap <silent> <Leader>w :write<CR>
nnoremap <silent> <Leader>x :xit<CR>

" Do the splits
nnoremap <leader>v :vsp<cr>
nnoremap <leader>s :sp<cr>

nnoremap <silent> <leader>p :NERDTreeToggle<CR>

" Takes a register (or * by default) and opens it in the cmdline-window.
" Hit <cr> when you're done editing for setting the register.
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Close the quick windows
nnoremap <leader>c :cclose<bar>lclose<cr>

" Redraw the screen
nnoremap <leader>rd :redraw!<CR>

" Adds markdown headers
nnoremap <leader>1 m`yypVr=``
nnoremap <leader>2 m`yypVr-``
nnoremap <leader>3 m`^i### <esc>``4l
nnoremap <leader>4 m`^i#### <esc>``5l
nnoremap <leader>5 m`^i##### <esc>``6l
