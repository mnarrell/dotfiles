" Discipline **********************************************************************************************************
noremap  <Up> ""
" noremap! <Up> <Esc>
noremap  <Down> ""
" noremap! <Down> <Esc>
noremap  <Left> ""
" noremap! <Left> <Esc>
noremap  <Right> ""
" noremap! <Right> <Esc>

nnoremap Q <nop>
nnoremap K <nop>

noremap Y y$

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" Split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" resize panes
" nnoremap <silent> <C-w><Right> :vertical resize +5<cr>
" nnoremap <silent> <C-w><Left> :vertical resize -5<cr>
" nnoremap <silent> <C-w><Up> :resize +5<cr>
" nnoremap <silent> <C-w><Down> :resize -5<cr>

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" scroll the viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

