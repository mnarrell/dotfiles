-- Inspired by:
-- - https://phelipetls.github.io/posts/async-make-in-nvim-with-lua
-- - https://github.com/fatih/vim-go/blob/master/autoload/go/test.vim
-- - https://github.com/ray-x/go.nvim

local helpers = require("mn.go.helpers")

local compile_efm = function()
  local efm = [[%-G#\ %.%#]]
  efm = efm .. [[,%-G%.%#panic:\ %m]]
  efm = efm .. [[,%Ecan\'t\ load\ package:\ %m]]
  efm = efm .. [[,%A%\\%%\(%[%^:]%\\+:\ %\\)%\\?%f:%l:%c:\ %m]]
  efm = efm .. [[,%A%\\%%\(%[%^:]%\\+:\ %\\)%\\?%f:%l:\ %m]]
  efm = efm .. [[,%C%*\\s%m]]
  -- efm = efm .. [[,%-G%.%#]]
  return efm
end

local build_on_event = function(cmd, output)
  local efm = compile_efm()

  return function(_, data, event)
    if event == "stdout" or event == "stderr" then
      if data then
        for _, value in ipairs(data) do
          if value ~= "" then
            table.insert(output, value)
          end
        end
      end
    end

    if event == "exit" then
      vim.fn.setqflist({}, " ", {
        title = cmd,
        lines = output,
        efm = efm,
      })

      -- P "output: "
      -- P(output)

      vim.api.nvim_command("doautocmd QuickFixCmdPost")

      if not vim.tbl_isempty(output) then
        helpers.error(" build failure!")
        vim.cmd.Trouble("qflist", "open")
      else
        vim.cmd.Trouble("qflist", "close")
        helpers.info(" build success!")
      end
    end
  end
end

local M = {}

M.build = function()
  local lines = {}
  local winnr = vim.fn.win_getid()
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)

  local cmd = { "go" }
  if helpers.is_test(bufname) then
    -- If we're on a test file, build the test command.
    for _, v in ipairs({ "test", "-c", bufname }) do
      table.insert(cmd, v)
    end
  else
    -- Otherwise build the build command.
    local modpath = vim.fs.dirname(vim.fs.find({ "go.mod" }, { path = bufname, upward = true })[1])
    for _, v in ipairs({ "build", modpath .. "/..." }) do
      table.insert(cmd, v)
    end
  end

  local cmdstr = vim.fn.expandcmd(vim.fn.join(cmd, " "))
  local on_event = build_on_event(cmdstr, lines)

  vim.fn.jobstart(cmd, {
    on_stderr = on_event,
    on_stdout = on_event,
    on_exit = on_event,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

return M
