vim.fn.sign_define('LspDiagnosticsSignError', {text='✗', texthl='LspDiagnosticsSignError'})
vim.fn.sign_define('LspDiagnosticsSignWarning', {text='⚠', texthl='LspDiagnosticsSignWarning'})
vim.fn.sign_define('LspDiagnosticsSignHint', {text='𝓲', texthl='LspDiagnosticsSignHint'})

  -- cmd(string.format('highlight! IncSearch ctermfg=White ctermbg=Red cterm=bold guifg=White guibg=%s', t4))
-- vim.fn.sign_define('LspDiagnosticsSignError', {text='❌', texthl='LspDiagnosticsSignError'})
-- vim.fn.sign_define('LspDiagnosticsSignWarning', {text='⚠️', texthl='LspDiagnosticsSignWarning'})
-- vim.fn.sign_define('LspDiagnosticsSignHint', {text='💡', texthl='LspDiagnosticsSignHint'})

local env = require('env')
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

-- local t4 = vim.g.terminal_color_4
-- local t4 = "#81a2be"

local function custom_attach(client, bufnr)
  print('\'' .. client.name .. '\' language server started')

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
  --   vim.api.nvim_exec(string.format([[
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

-- LUA{{{
local function lua_runtime()
  local result = {}
  for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
    local lua_path = path .. '/lua/'
    if vim.fn.isdirectory(lua_path) then result[lua_path] = true end
  end

  result[vim.fn.expand('$VIMRUNTIME/lua')] = true
  result[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
  result[vim.fn.expand(env.home .. '/src/neovim/src/nvim/lua')] = true

  return result
end

local sumneko_root = env.home .. '/src/lua-language-server'
local sumneko_bin = sumneko_root .. '/bin/macOS/lua-language-server'

lspconfig.sumneko_lua.setup {
  on_attach = custom_attach,
  cmd = {sumneko_bin, '-E', sumneko_root .. '/main.lua'},
  settings = {
    Lua = {
      runtime = {
        -- Get the language server to recognize LuaJIT globals like `jit` and `bit`
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      completion = {keywordSnippet = 'Disable'},
      diagnostics = {
        enable = true,
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = {library = lua_runtime()}
    }
  }
}
-- }}}

lspconfig.dockerls.setup {
  on_attach = custom_attach,
  root_dir = function(fname) return lspconfig.util.find_git_ancestor(fname) end
}

-- lspconfig.pyls.setup {on_attach = custom_attach}
lspconfig.pyright.setup {on_attach = custom_attach, settings = {python = {formatting = {provider = 'yapf'}}}}
lspconfig.vimls.setup {on_attach = custom_attach}
lspconfig.jsonls = {cmd = {'json-languageserver', '--stdio'}}
lspconfig.terraformls.setup {on_attach = custom_attach}
lspconfig.bashls.setup {on_attach = custom_attach, filetypes = {'sh', 'zsh', 'bash'}}

-- lspconfig.efm = require('lsp.efm')(lspconfig, custom_attach)
