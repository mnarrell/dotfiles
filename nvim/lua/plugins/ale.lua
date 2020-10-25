local g = vim.g
local cmd = vim.api.nvim_command

cmd('highlight! ALEErrorSign ctermbg=18 ctermfg=red cterm=bold')

g.ale_echo_msg_error_str = 'E'
g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
g.ale_echo_msg_warning_str = 'W'
g.ale_go_staticcheck_lint_package = 1
g.ale_lint_on_text_changed = 'normal'
g.ale_sign_error = '✗'
-- g.ale_sign_error = '❌'
g.ale_sign_warning = '⚠'

g.ale_linters = {
  go = {'staticcheck', 'vet', 'golint'},
  markdown = {'alex', 'markdownlint'},
  python = {'pyls'},
  yaml = {'yamllint'}
}

g.ale_fixers = {
  bash = {'shfmt'},
  html = {'prettier'},
  markdown = {'prettier'},
  sh = {'shfmt'},
  yaml = {'prettier'}
}

require('tools').apply_mappings({
  {'n', '<Leader>at', ':ALEToggle<CR>'}
}, {silent = true, noremap = true})
