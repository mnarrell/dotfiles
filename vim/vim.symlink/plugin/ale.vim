scriptencoding utf-8

let g:ale_lint_on_text_changed = 'normal'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_linters = { 'go': ['staticcheck', 'golint', 'gosimple']}
" let g:ale_linters = { 'go': ['golangserver']}
" let g:ale_linters = { 'go': ['golangci-lint']}

nnoremap <leader>at :ALEToggle<CR>
