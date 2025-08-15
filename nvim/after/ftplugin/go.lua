-- Options
local opt = vim.opt_local
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.formatprg = "par -w78rs"

-- Support
local is_test = function(filename)
  return filename:find("_test%.go$")
end

local is_source = function(filename)
  return filename:find("%.go$")
end

local info = function(msg)
  vim.api.nvim_echo({ { msg, "Function" } }, false, {})
end

local error = function(msg)
  vim.api.nvim_echo({ { msg, "ErrorMsg" } }, false, {})
end

-- Alternates TODO plugin?
local alternate = function(filename)
  if is_test(filename) then
    return string.gsub(filename, "_test.go", ".go")
  elseif is_source(filename) then
    return vim.fn.expand("%:r") .. "_test.go"
  else
    vim.notify("not a go file", vim.lsp.log_levels.ERROR)
  end
end

local switch = function(cmd)
  local alt_file = alternate(vim.fn.expand("%"))
  if not vim.fn.filereadable(alt_file) and not vim.fn.bufexists(alt_file) then
    vim.notify("couldn't find " .. alt_file, vim.lsp.log_levels.ERROR)
    return
  elseif #cmd <= 1 then
    local ocmd = "e " .. alt_file
    vim.cmd(ocmd)
  else
    local ocmd = cmd .. " " .. alt_file
    vim.cmd(ocmd)
  end
end

-- Build

-- Inspired by:
-- - https://phelipetls.github.io/posts/async-make-in-nvim-with-lua
-- - https://github.com/fatih/vim-go/blob/master/autoload/go/test.vim
-- - https://github.com/ray-x/go.nvim

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
        error(" build failure!")
        -- vim.cmd.Trouble("qflist", "open")
        vim.cmd.copen()
      else
        -- vim.cmd.Trouble("qflist", "close")
        vim.cmd.cclose()
        info(" build success!")
      end
    end
  end
end

local build = function()
  local lines = {}
  local winnr = vim.fn.win_getid()
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)

  local cmd = { "go" }
  if is_test(bufname) then
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

-- Commands
local cmd = function(lhs, rhs)
  vim.api.nvim_create_user_command(lhs, rhs, { bang = true })
end

cmd("A", function()
  switch("")
end)

cmd("AS", function()
  switch("split")
end)

cmd("AV", function()
  switch("vsplit")
end)

cmd("AT", function()
  switch("tabe")
end)

-- Mappings
local map = function(lhs, rhs)
  vim.keymap.set("n", lhs, rhs, { buffer = true, silent = true })
end

map("gb", build)
