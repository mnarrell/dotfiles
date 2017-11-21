" Zap trailing whitespace in the current buffer.
nnoremap <silent> <Leader>zz :call mappings#leader#zap()<CR>

nnoremap <silent> <Leader>o :only<CR>
nnoremap <silent> <Leader>q :quit<CR>
nnoremap <silent> <Leader>w :write<CR>
nnoremap <silent> <Leader>x :xit<CR>

" Do the splits
nnoremap <leader>v :vsp<cr>
nnoremap <leader>s :sp<cr>

" Close buffer
noremap <leader>c :bd<CR>
