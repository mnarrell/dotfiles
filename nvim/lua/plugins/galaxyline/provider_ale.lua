local M = {}

local err = "error"
local warn = "warning"

local symbol = {
  [err] = 'E',
  [warn] = 'W',
}

local function current_bufnr()
  return vim.api.nvim_win_get_buf(vim.fn.win_getid())
end

local function counts()
  return vim.fn['ale#statusline#Count'](current_bufnr())
end

local function get_line_number(num, type)
  if num == 0 then return '' end
  local line = vim.fn['ale#statusline#FirstProblem'](current_bufnr(), type)
  if line.lnum == nil then
    return ''
  end
  return string.format('(L%s)', line.lnum)
end

local function get(type)
 if vim.fn['ale#engine#IsCheckingBuffer'](current_bufnr()) == 1 then
   return type == err and '' or '...'
 end

  local c = counts()
  -- emit(c)
  local type_total = c[type] + c['style_' .. type]

  if type_total > 0 then
    return string.format('%s:%s%s ', symbol[type], type_total, get_line_number(type_total, type))
  end
end

function M.check_warnings()
  return counts().warning > 0
end

function M.warnings()
  return get(warn)
end

function M.check_errors()
  return counts().error > 0
end

function M.errors()
  return get(err)
end

return M
