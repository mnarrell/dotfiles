scriptencoding utf-8

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

" Option-L
nnoremap <silent> ¬ :call functions#ToggleLocationList()<CR>
" Option-C
nnoremap <silent> ç :call functions#ToggleQuickFix()<CR>

" Or use built-in gt/gT to traverse between tabs
nnoremap <silent> ]<Tab> :tabnext<CR>
nnoremap <silent> [<Tab> :tabprev<CR>

" Tab management
nnoremap <silent> <leader>+ :tabnew<CR>:edit .<CR>
nnoremap <silent> <leader>) :tabonly<CR>
nnoremap <silent> <leader>- :tabclose<CR>

" Force a file type
nnoremap _md :set filetype=markdown<CR>
nnoremap _py :set filetype=python<CR>
nnoremap _sh :set filetype=sh<CR>
nnoremap _ba :set filetype=bash<CR>
nnoremap _tx :set filetype=text<CR>
nnoremap _vi :set filetype=vim<CR>
nnoremap _xm :set filetype=xml<CR>
nnoremap _df :set filetype=Dockerfile<CR>
nnoremap _zs :set filetype=zsh<CR>

nnoremap <Up> :cprevious<CR>
nnoremap <Down> :cnext<CR>