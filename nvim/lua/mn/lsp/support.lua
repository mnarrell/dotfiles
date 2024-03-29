local diagnostics_enabled = true

local toggle_diagnostics = function()
  if diagnostics_enabled then
    vim.notify("Disabling diagnostics...", vim.log.levels.INFO, { title = "LSP" })
    vim.diagnostic.disable()
    vim.diagnostic.reset(nil, 0)
    diagnostics_enabled = false
  else
    vim.notify("Enabling diagnostics...", vim.log.levels.INFO, { title = "LSP" })
    vim.diagnostic.enable()
    diagnostics_enabled = true
  end
end

local show_line_diagnostics = function()
  vim.diagnostic.open_float({
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = "rounded",
    -- border = "single",
    source = "always", -- show source in diagnostic popup window
    prefix = " ",
  })
end

local M = {}

M.on_attach = function(client, bufnr)
  -- vim.notify(client.name .. " attached to dis", vim.lsp.log_levels.INFO)

  -- if client.server_capabilities.inlayHintProvider then
  --   vim.lsp.inlay_hint(bufnr, true)
  -- end

  local map = function(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true })
  end

  -- vim.keymap.set("n", "<C-d>", "<Cmd>Telescope diagnostics<CR>", { desc = "search lsp diagnostics" })
  map("<LocalLeader>d", require("telescope.builtin").diagnostics)

  map("gD", vim.lsp.buf.declaration)
  map("<c-]>", vim.lsp.buf.definition)
  map("K", vim.lsp.buf.hover)
  map("<C-s>", vim.lsp.buf.signature_help)
  map("<Leader>D", vim.lsp.buf.type_definition)
  map("gr", vim.lsp.buf.rename)
  map("<leader>ld", show_line_diagnostics)
  map("<Leader>ll", "<cmd>TroubleToggle document_diagnostics<cr>")
  map("<LocalLeader>a", vim.lsp.buf.code_action)
  map("gi", require("telescope.builtin").lsp_implementations)
  map("gf", require("telescope.builtin").lsp_references)
  map("<leader>li", require("telescope.builtin").lsp_incoming_calls)
  map("<leader>lo", require("telescope.builtin").lsp_outgoing_calls)
  map("<LocalLeader>s", require("telescope.builtin").lsp_document_symbols)
  map("<LocalLeader>w", require("telescope.builtin").lsp_dynamic_workspace_symbols)
  map("<Localleader>l", vim.lsp.codelens.run)

  map("<Leader>lf", function()
    vim.lsp.buf.format({ timeout_ms = 6000 })
  end)

  map("de", function()
    require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" })
  end)

  map("[d", function()
    vim.diagnostic.goto_prev({ float = { border = "rounded" } })
  end)

  map("]d", function()
    vim.diagnostic.goto_next({ float = { border = "rounded" } })
  end)

  map("yod", toggle_diagnostics)
end

M.capabilities = function()
  local caps = vim.lsp.protocol.make_client_capabilities()

  local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if ok then
    caps = cmp_nvim_lsp.default_capabilities(caps)
  end

  caps.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  return caps
end

return M
