augroup kube
  au BufRead,BufEnter kube/.kube/config set filetype=yaml
  au BufRead,BufEnter ~/.kube/config set filetype=yaml
augroup END
