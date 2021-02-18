vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-s'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

require('tools').apply_mappings({
  {'n', 'q:', [[:History:<CR>]], {silent = true}},
  {'n', 'q/', [[:History/<CR>]], {silent = true}},
  {'i', '<C-x><C-l>', [[<Plug>(fzf-complete-line)]], {silent = true}},
  {'i', '<C-x><C-k>', [[<Plug>(fzf-complete-word)]]},
  {'i', '<C-x><C-f>', [[<Plug>(fzf-complete-path)]]},
  {'i', '<C-x><C-j>', [[<Plug>(fzf-complete-file-ag)]]},
  {'n', '<Leader><tab>', [[<Plug>(fzf-maps-n)]]}
})


-- function! s:build_quickfix_list(lines) abort
--   " vint: -ProhibitUnnecessaryDoubleQuote
--   call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
--   " vint: +ProhibitUnnecessaryDoubleQuote
--   copen
--   cc
-- endfunction

-- let g:fzf_action = {
--       \ 'ctrl-q': function('s:build_quickfix_list'),
--       \ 'ctrl-t': 'tab split',
--       \ 'ctrl-s': 'split',
--       \ 'ctrl-v': 'vsplit' }

-- let g:rg_command = '
--   \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
--   \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
--   \ -g "!{.git,node_modules,vendor}/*" '

