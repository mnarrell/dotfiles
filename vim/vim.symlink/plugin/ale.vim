scriptencoding utf-8

let g:ale_lint_on_text_changed = 'normal'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

highlight ALEErrorSign ctermbg=18 ctermfg=red cterm=bold

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_go_staticcheck_lint_package = 1

let g:ale_linters = {
  \ 'go': ['vet', 'golint'],
  \ 'yaml': ['yamllint']
  \ }

nnoremap <leader>at :ALEToggle<CR>
