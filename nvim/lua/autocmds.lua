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
        vim.bo.filetype = 'ruby'
        vim.bo.syntax = 'brewfile'
      end }
  },

  dockerfile = {
    { 'BufRead,BufEnter', '[Dd]ockerfile.[^vim],Dockerfile*', function()
      vim.bo.filetype = 'dockerfile'
    end }
  },

  gitconfig = {
    { 'BufRead,BufEnter', '*/git/config,*/git/config.local', function()
      vim.bo.filetype = 'gitconfig'
    end }
  },

  kubeconfig = {
    { 'BufRead,BufEnter', '*/.kube/config', function()
      vim.bo.filetype = 'yaml'
    end }
  },

  sshconfig = {
    { 'BufRead,BufEnter', '*/.ssh/config', function()
      vim.bo.filetype = 'sshconfig'
    end }
  },

  staticcheck = {
    { 'BufRead,BufEnter', 'staticcheck.conf', function()
      vim.bo.filetype = 'toml'
    end }
  },
})
