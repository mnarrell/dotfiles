local o = vim.o

local M = {}

M.brewfile = function()
  o.filetype = 'ruby'
  o.syntax = 'brewfile'
end

M.dockerfile = function()
  o.filetype = 'dockerfile'
end

M.helm = function()
  o.filetype = 'helm'
end

M.gitconfig = function()
  o.filetype = 'gitconfig'
end

M.kubeconfig = function()
  o.filetype = 'yaml'
end

M.sshconfig = function()
  o.filetype = 'sshconfig'
end

M.staticcheck = function()
  o.filetype = 'toml'
end

M.json = function()
  o.equalprg = "jq ."
  o.formatprg = "jq ."
end

vim.cmd([[
  augroup ftdetect
    au!

    autocmd FocusLost,WinLeave, * :silent! wa
    autocmd BufWritePre * :call functions#Preserve('%s/\v\s+$//e')
    autocmd VimResized * :wincmd =

    autocmd TermOpen * setlocal nolist nospell noshowmode

    autocmd BufWinEnter,WinEnter term://* startinsert

    autocmd BufRead,BufEnter Brewfile lua require('ftdetect').brewfile()
    autocmd BufRead,BufEnter [Dd]ockerfile.*[^lua] lua require('ftdetect').dockerfile()
    autocmd BufRead,BufEnter */templates/*.yaml lua require('ftdetect').helm()
    autocmd BufRead,BufEnter */git/config,*/git/config.local lua require('ftdetect').gitconfig()
    autocmd BufRead,BufEnter */.kube/config lua require('ftdetect').kubeconfig()
    autocmd BufRead,BufEnter */.ssh/config lua require('ftdetect').sshconfig()
    autocmd BufRead,BufEnter staticcheck.conf lua require('ftdetect').staticcheck()
    autocmd BufRead,BufEnter *.json lua require('ftdetect').json()

    autocmd BufWritePost *.hcl ALEFix
  augroup end
]])

return M
