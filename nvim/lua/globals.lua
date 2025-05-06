-- Pretty print a Lua table.
P = function(v)
  print(vim.inspect(v))
  return v
end

-- Reload a Lua module with Plenary.
RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

-- Save and reload source files.
SaveAndReload = function()
  vim.cmd("silent! write")

  local ft = vim.bo.filetype
  if ft == "vim" then
    vim.cmd("source %")
  elseif ft == "lua" then
    vim.cmd("luafile %")
  end
end

-- Log to a custom log file.
LOG = function(msg)
  local logPath = string.format("%s/mn.log", vim.fn.stdpath("state"))
  local file = assert(io.open(logPath, "a"), "unable to open " .. logPath)
  io.output(file)
  io.write(msg .. "\n")
  io.close(file)
end

-- Base64 decode a visual selection.
Base64Decode = function()
  -- b2hhaQ==
  vim.cmd([[noau normal! gv"vy]])
  local cmd = string.format("echo -n %s | base64 -d", vim.fn.getreg("v"))
  local decoded = vim.fn.systemlist(cmd)
  local popup = require("nui.popup")
  local event = require("nui.utils.autocmd").event

  local win = popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
    },
    position = "50%",
    size = {
      width = "40%",
      height = "60%",
    },
  })

  win:mount()

  win:on(event.BufLeave, function()
    win:unmount()
  end)

  vim.api.nvim_buf_set_lines(win.bufnr, 0, 1, false, decoded)
end

LazyFile = { "BufReadPost", "BufNewFile", "BufWritePre" }
