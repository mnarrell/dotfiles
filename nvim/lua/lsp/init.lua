vim.fn.sign_define('LspDiagnosticsSignError', {text='✗', texthl='LspDiagnosticsSignError'})
vim.fn.sign_define('LspDiagnosticsSignWarning', {text='⚠', texthl='LspDiagnosticsSignWarning'})
vim.fn.sign_define('LspDiagnosticsSignHint', {text='𝓲', texthl='LspDiagnosticsSignHint'})

local lspconfig = require('lspconfig')
local completion = require('completion')

local publishDiagnostics = 'textDocument/publishDiagnostics'

vim.lsp.handlers[publishDiagnostics] = function(...)
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false
  })(...)
end

local default_handler = vim.lsp.handlers[publishDiagnostics]
vim.lsp.handlers[publishDiagnostics] = function (err, method, result, client_id, bufnr, config)
  default_handler(err, method, result, client_id, bufnr, config)
  local diagnostics = vim.lsp.diagnostic.get_all()
  local qflist = {}
  for bn,diagnostic in pairs(diagnostics) do
    for _,d in ipairs(diagnostic) do
      table.insert(qflist, {
        bufnr = bn,
        lnum = d.range.start.line + 1,
        col = d.range.start.character + 1,
        text = d.message,
      })
    end
  end
  vim.lsp.util.set_qflist(qflist)
end

local function custom_attach(client, bufnr)
  print(string.format([['%s', language server started]], client.name))

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = {noremap = true, silent = true}
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<Leader>lk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'ge', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<Leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('n', '<Leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  -- -- Set autocommands conditional on server_capabilities
  -- if client.resolved_capabilities.document_highlight then
  --   vim.exec(string.format([[
  --     hi LspReferenceRead cterm=bold ctermfg=Blue guifg=White guibg=NONE
  --     hi LspReferenceText cterm=bold ctermfg=Blue guifg=White guibg=NONE
  --     hi LspReferenceWrite cterm=bold ctermfg=Blue guifg=White guibg=NONE
  --     augroup lsp_document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]], t4, t4, t4), false)
  -- end

  -- wrap it here THIS is the extra completion plugin
  completion.on_attach(client)

end

require("lsp.lua").setup(lspconfig, custom_attach)
-- lspconfig.efm = require('lsp.efm')(lspconfig, custom_attach)

lspconfig.dockerls.setup {
  on_attach = custom_attach,
  root_dir = function(fname) return lspconfig.util.find_git_ancestor(fname) end
}

-- lspconfig.pyls.setup {on_attach = custom_attach}
lspconfig.pyright.setup {on_attach = custom_attach, settings = {python = {formatting = {provider = 'yapf'}}}}
lspconfig.vimls.setup {on_attach = custom_attach}

lspconfig.jsonls.setup {
  on_attach = custom_attach,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}

lspconfig.terraformls.setup {on_attach = custom_attach}
lspconfig.bashls.setup {on_attach = custom_attach, filetypes = {'sh', 'zsh', 'bash'}}
