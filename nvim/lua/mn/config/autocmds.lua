local autocmds = vim.api.nvim_create_augroup("auto", { clear = true })

-- Save on focus lost
vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
  command = ":silent! wa",
  group = autocmds,
})

-- Trim whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(_)
    local pos = vim.fn.winsaveview()
    local cmds = {
      [[%s/\v\s+$//e]],
      [[%s/\($\n\s*\)\+\%$//e]],
    }
    for _, cmd in pairs(cmds) do
      vim.cmd(cmd)
    end
    vim.fn.winrestview(pos)
  end,
  group = autocmds,
})

vim.api.nvim_create_autocmd("VimResized", {
  command = ":wincmd =",
  group = autocmds,
})

-- Make the terminal more terminaly.
vim.api.nvim_create_autocmd("TermOpen", {
  command = [[
    setlocal nolist nonumber norelativenumber noshowmode nospell
    startinsert
  ]],
  group = autocmds,
})

-- Let q close these windows
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
  group = autocmds,
})

-- Highlight what was yanked.
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
  group = autocmds,
})

-- Disable inserting comment leader after hitting o or O or <Enter>
vim.api.nvim_create_autocmd("FileType", {
  -- pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove("o")
    vim.opt_local.formatoptions:remove("r")
  end,
  group = autocmds,
})
