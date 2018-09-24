scriptencoding utf-8

let g:ale_lint_on_text_changed = 'normal'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
  \ 'go': ['staticcheck', 'golint', 'gosimple'],
  \ 'yaml': ['yamllint']
  \ }

" let g:ale_linters = { 'go': ['golangserver']}
" let g:ale_linters = { 'go': ['golangci-lint']}

nnoremap <leader>at :ALEToggle<CR>
