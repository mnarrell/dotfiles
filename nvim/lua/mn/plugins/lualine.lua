return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local statusline = require("mn.statusline")
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {
          statusline = {
            -- "netrw",
            -- "quickfix",
          },
        },
        theme = {
          normal = { c = "StatusLineThemeNormalC" },
          inactive = { c = "StatusLineThemeInactiveC" },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "quickfix", "fugitive" },
    }

    local add_left = function(component)
      table.insert(config.sections.lualine_a, component)
    end

    local add_right = function(component)
      table.insert(config.sections.lualine_x, component)
    end

    add_left({
      function()
        return statusline.icons.sep.left
      end,
      color = "StatusLineSeparator",
      padding = { left = 0, right = 0 },
    })

    add_left({
      statusline.mode,
      color = "StatusLineViMode",
    })

    add_left({
      function()
        return statusline.icons.git
      end,
      cond = statusline.conditions.check_git_workspace,
      color = "StatusLineGitIcon",
      padding = { left = 0, right = 0 },
    })

    add_left({
      -- "branch",
      "FugitiveHead",
      icon = "",
      color = "StatusLineTextBold",
      padding = { left = 0, right = 0 },
    })

    add_left({
      statusline.file_info,
      -- cond = statusline.conditions.buffer_not_empty,
      color = "StatusLineFileInfo",
    })

    add_left({
      function()
        return statusline.icons.sep.right
      end,
      color = "StatusLineSeparator",
      padding = { left = 0, right = 0 },
    })

    add_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        error = "StatusLineDiagnosticError",
        warn = "StatusLineDiagnosticWarn",
        info = "StatusLineDiagnosticInfo",
      },
    })

    add_left({
      statusline.mixed_indent,
      color = "StatusLineMixedIndent",
    })

    add_right({
      function()
        return statusline.icons.sep.left
      end,
      color = "StatusLineSeparator",
      padding = { left = 0, right = 0 },
    })

    add_right({
      statusline.filetype,
      color = "StatusLineTextBold",
      -- padding = { left = 0, right = 0 },
    })

    add_right({
      statusline.position_info,
      color = "StatusLineTextBold",
    })

    add_right({
      function()
        return statusline.icons.sep.right
      end,
      color = "StatusLineSeparator",
      padding = { left = 0, right = 0 },
    })

    -- Inactive split
    table.insert(config.inactive_sections.lualine_a, {
      statusline.inactive_filename,
      cond = statusline.conditions.buffer_not_empty,
      color = "StatusLineInactiveFilename",
    })
    return config
  end,
}
