scriptencoding utf-8

let g:ale_open_list = 1

let g:ale_enabled = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'normal'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nnoremap <leader>at :ALEToggle<CR>
