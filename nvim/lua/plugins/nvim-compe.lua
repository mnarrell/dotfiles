require'compe'.setup {
  enabled = true;
  autocomplete = true;
  source = {
    path = false;
    buffer = true;
    calc = false;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
    ultisnips = true;
  };
}
