local M = {}

--- Diagnostic severities.
M.diagnostics = {
  ERROR = "",
  WARN = "",
  HINT = "",
  INFO = "",
}

--- For folding.
M.arrows = {
  right = "",
  left = "",
  up = "",
  down = "",
}

--- LSP symbol kinds.
M.symbol_kinds = {
  Array = "󰅪",
  Class = "",
  Color = "󰏘",
  Constant = "󰏿",
  Constructor = "",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "󰜢",
  File = "󰈙",
  Folder = "󰉋",
  Function = "󰆧",
  Interface = "",
  Keyword = "󰌋",
  Method = "󰆧",
  Module = "",
  Operator = "󰆕",
  Property = "󰜢",
  Reference = "󰈇",
  Snippet = "",
  Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Variable = "󰀫",
}

--- Shared icons that don't really fit into a category.
M.misc = {
  bug = "",
  ellipsis = "…",
  git = "",
  search = "",
  vertical_bar = "│",
  dashed_bar = "┊",
}

M.signs = {
  GitAdded = "",
  GitModified = "",
  GitRemoved = "",
  GitRenamed = "",
  Running = "",
  PassCheck = "",
  CheckAlt = " ",
  Forbidden = "",
  FolderClosed = "",
  FolderOpen = "",
  FolderEmpty = "",
  FolderEmptyOpen = "",
  LightBulb = "",
  Config = "",
  Branch = "",
  Code = " ",
  Package = " ",
  Keyboard = " ",
  File = " ",
  Vim = " ",
  QuestionMark = " ",
  Loading = " ",
  Cmd = " ",
  Event = " ",
  Init = " ",
  Expanded = "",
  Collapsed = "",
  Bookmark = "",
  PendingSave = "",
  Left = "",
  Right = "",
}

return M
