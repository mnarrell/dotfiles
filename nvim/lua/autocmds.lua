local opt = require('options').opt

require('tools').create_autocmds({
  general = {
    {'FocusLost,WinLeave', '*', [[:silent! wa]]},
    {'BufWritePre', '*', [[:call functions#Preserve('%s/\v\s+$//e')]]},
    {'VimResized', '*', [[:wincmd =]]}
  },

  terminal = {
    {'TermOpen', '*', [[setlocal nolist nospell noshowmode]]},
    {'TermOpen', '*', [[startinsert]]}
  },

  brewfile = {
    { 'BufRead,BufEnter', 'Brewfile', function()
        opt.filetype = 'ruby'
        opt.syntax = 'brewfile'
      end }
  },

  dockerfile = {
    { 'BufRead,BufEnter', [[[Dd]ockerfile\.(lua|vim)\@!.*$]], function()
      opt.filetype = 'dockerfile'
    end }
  },

  helm = {
    {'BufRead,BufEnter', '*/templates/*.yaml', function()
      opt.filetype = 'helm'
    end }
  },

  gitconfig = {
    { 'BufRead,BufEnter', '*/git/config,*/git/config.local', function()
      opt.filetype = 'gitconfig'
    end }
  },

  kubeconfig = {
    { 'BufRead,BufEnter', '*/.kube/config', function()
      opt.filetype = 'yaml'
    end }
  },

  sshconfig = {
    { 'BufRead,BufEnter', '*/.ssh/config', function()
      opt.filetype = 'sshconfig'
    end }
  },

  staticcheck = {
    { 'BufRead,BufEnter', 'staticcheck.conf', function()
      opt.filetype = 'toml'
    end }
  },
})
