nnoremap gG gggqgG''

nnoremap Q <nop>
" nnoremap <silent> K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Repeat last macro if in normal buffer.
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

" Make Y behave like C and D
nnoremap Y y$

" Split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" scroll the viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
