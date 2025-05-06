local icons = require "icons"

---@type table<string, string?>
local progress_status = {
  client = nil,
  kind = nil,
  title = nil,
}

vim.api.nvim_create_autocmd("LspProgress", {
  group = vim.api.nvim_create_augroup("mariasolos/statusline", { clear = true }),
  desc = "Update LSP progress in statusline",
  pattern = { "begin", "end" },
  callback = function(args)
    -- This should in theory never happen, but I've seen weird errors.
    if not args.data then
      return
    end

    progress_status = {
      client = vim.lsp.get_client_by_id(args.data.client_id).name,
      kind = args.data.params.value.kind,
      title = args.data.params.value.title,
    }

    if progress_status.kind == "end" then
      progress_status.title = nil
      -- Wait a bit before clearing the status.
      vim.defer_fn(function()
        vim.cmd.redrawstatus()
      end, 30000)
    else
      -- vim.cmd.redrawstatus()
      vim.defer_fn(function()
        vim.cmd.redrawstatus()
      end, 30000)
    end
  end,
})

--- The latest LSP progress message.
---@return string
local function lsp_progress_component()
  if not progress_status.client or not progress_status.title then
    return ""
  end

  -- Avoid noisy messages while typing.
  if vim.startswith(vim.api.nvim_get_mode().mode, "i") then
    return ""
  end

  return string.format("%s %s", progress_status.client, progress_status.title)
end

-- local conditions = {
--   buffer_not_empty = function()
--     return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
--   end,
--   hide_in_width = function()
--     return vim.fn.winwidth(0) > 80
--   end,
--   check_git_workspace = function()
--     local filepath = vim.fn.expand("%:p:h")
--     local gitdir = vim.fn.finddir(".git", filepath .. ";")
--     return gitdir and #gitdir > 0 and #gitdir < #filepath
--   end,
-- }

local branch_component = {
  "branch",
  -- separator = { left = icons.vertical_bar, right = icons.vertical_bar },
  icon = icons.misc.git,
  separator = "-",
}

local filename_component = {
  "filename",
  path = 4, -- 0: Just the filename
  -- 1: Relative path
  -- 2: Absolute path
  -- 3: Absolute path, with tilde as the home directory
  -- 4: Filename and parent dir, with tilde as the home directory

  symbols = {
    unnamed = "", -- Text to show for unnamed buffers.
  },
}

local searchcount_component = {
  "searchcount",
  fmt = function(str)
    if str == "" then
      return ""
    end
    return string.format("matches: %s", str)
  end,
}

local diagnostics_component = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = {
    error = icons.diagnostics.ERROR .. " ",
    warn = icons.diagnostics.WARN .. " ",
    info = icons.diagnostics.INFO .. " ",
    hint = icons.diagnostics.HINT .. " ",
  },
}

local lsp_component = {
  "lsp_status",
  ignore_lsp = { "copilot" },
}

local right_component = {
  function()
    return "▊"
  end,
  padding = { left = 1 },
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
        end,
      } },
      lualine_b = { branch_component, filename_component, searchcount_component },
      lualine_c = { diagnostics_component, lsp_component, lsp_progress_component },
      -- lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_x = { "filetype" },
      lualine_y = { "progress", "location", right_component },
      lualine_z = {},
    },
  },
}
