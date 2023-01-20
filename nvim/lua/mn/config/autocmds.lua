local autocmds = vim.api.nvim_create_augroup("auto", { clear = true })

vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
  command = ":silent! wa",
  group = autocmds,
})

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

vim.api.nvim_create_autocmd("TermOpen", {
  command = [[
    setlocal nolist nonumber norelativenumber noshowmode nospell
    startinsert
  ]],
  group = autocmds,
})

vim.api.nvim_create_autocmd("FileType", {
  command = "nnoremap <buffer><silent> q :close <CR>",
  pattern = "lspinfo",
  group = autocmds,
})

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

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
  group = autocmds,
})
