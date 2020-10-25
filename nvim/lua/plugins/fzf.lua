local g = vim.g

g.fzf_action = {
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
