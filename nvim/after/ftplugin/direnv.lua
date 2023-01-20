local allow = function()
  vim.fn.system({ "direnv", "allow", vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.") })
  vim.schedule(function()
    vim.notify("direnv updated...", vim.log.levels.INFO)
  end)
end

vim.api.nvim_buf_create_user_command(0, "DA", allow, { bang = true })

local autocmds = vim.api.nvim_create_augroup("direnvAutocmds", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function(_)
    allow()
  end,
  group = autocmds,
  buffer = 0,
})

vim.opt_local.commentstring = "# %s"
