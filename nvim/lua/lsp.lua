local diagnostic_icons = require("icons").diagnostics
local methods = vim.lsp.protocol.Methods
local auGroup = vim.api.nvim_create_augroup("lsp", { clear = true })

--- Sets up LSP keymaps and autocommands for the given buffer.
---@param client vim.lsp.Client
---@param bufnr integer
local on_attach = function(client, bufnr)
  ---@param lhs string
  ---@param rhs string|function
  local map = function(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true })
  end

  -- vim.lsp.inlay_hint.enable(false)

  -- map("<c-]>", vim.lsp.buf.definition)
  -- map("gD", vim.lsp.buf.declaration)
  -- map("<Leader>D", vim.lsp.buf.type_definition)
  -- map("gf", require("telescope.builtin").lsp_references)
  -- map("grr", require("telescope.builtin").lsp_references)
  -- map("gri", require("telescope.builtin").lsp_implementations)
  -- map("<LocalLeader>s", require("telescope.builtin").lsp_document_symbols)
  -- map("<LocalLeader>w", require("telescope.builtin").lsp_dynamic_workspace_symbols)

  -- stylua: ignore start
  map("<Leader>ll", "<cmd>Trouble diagnostics toggle<cr>")
  map("c-]", function() Snacks.picker.lsp_definitions() end)
  map("gD", function() Snacks.picker.lsp_declarations() end)
  map("<Leader>D", function() Snacks.picker.lsp_type_definitions() end)
  map("grr", function() Snacks.picker.lsp_references() end)
  map("gri", function() Snacks.picker.lsp_implementations() end)
  map("<LocalLeader>s", function() Snacks.picker.lsp_symbols() end)
  map("<LocalLeader>w", function() Snacks.picker.lsp_workspace_symbols() end)
  map("<Localleader>l", vim.lsp.codelens.run)
  map("<LocalLeader>d", "<cmd>Trouble diagnostics toggle<cr>")
  map("<LocalLeader>f", function() vim.lsp.buf.format({ timeout_ms = 6000 }) end)
  -- stylua: ignore end

  if client:supports_method(methods.textDocument_definition) then
    map("de", function()
      Snacks.picker.lsp_definitions({ confirm = "vsplit" })
      -- require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" })
    end)
  end

  -- if client:supports_method(methods.textDocument_documentHighlight) then
  --   local under_cursor_hl_group = vim.api.nvim_create_augroup("mn/cursor_highlights", { clear = false })
  --   vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
  --     group = under_cursor_hl_group,
  --     desc = "Highlight references under cursor",
  --     buffer = bufnr,
  --     callback = vim.lsp.buf.document_highlight,
  --   })
  --   vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
  --     group = under_cursor_hl_group,
  --     desc = "Clear highlight references",
  --     buffer = bufnr,
  --     callback = vim.lsp.buf.clear_references,
  --   })
  -- end

  if client:supports_method(methods.textDocument_inlayHint) then
    vim.api.nvim_create_user_command("TH", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, {})
  end

  if client:supports_method("textDocument/foldingRange") then
    local win = vim.api.nvim_get_current_win()
    vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
  end
end

local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
  return hover({
    max_height = math.floor(vim.o.lines * 0.5),
    max_width = math.floor(vim.o.columns * 0.4),
    border = "rounded",
  })
end

local signature_help = vim.lsp.buf.signature_help
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.signature_help = function()
  return signature_help({
    max_height = math.floor(vim.o.lines * 0.5),
    max_width = math.floor(vim.o.columns * 0.4),
    border = "rounded",
  })
end

-- Diagnostics.
vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = false,
  underline = true,
  float = true,
  signs = {
    text = {
      [vim.diagnostic.severity.INFO] = diagnostic_icons.INFO,
      [vim.diagnostic.severity.HINT] = diagnostic_icons.HINT,
      [vim.diagnostic.severity.WARN] = diagnostic_icons.WARN,
      [vim.diagnostic.severity.ERROR] = diagnostic_icons.ERROR,
    },
  },
})

-- Show diagnostics.
vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
  group = auGroup,
  callback = function()
    vim.diagnostic.open_float({
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = true, -- show source in diagnostic popup window
      prefix = " ",
    })
  end,
})

-- Update mappings when registering dynamic capabilities.
local register_capability = vim.lsp.handlers[methods.client_registerCapability]
vim.lsp.handlers[methods.client_registerCapability] = function(err, res, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not client then
    return
  end

  on_attach(client, vim.api.nvim_get_current_buf())

  return register_capability(err, res, ctx)
end

-- Attach keymaps and autocommands.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    if client.name == "ruff" then
      -- Disable hover in favor of LSP.
      client.server_capabilities.hoverProvider = false
    end

    on_attach(client, args.buf)
  end,
})

-- Enable the LSP servers.
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  once = true,
  callback = function()
    local server_configs = vim
      .iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
      :map(function(file)
        return vim.fn.fnamemodify(file, ":t:r")
      end)
      :totable()

    vim.lsp.enable(server_configs)
  end,
})
