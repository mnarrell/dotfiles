local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

local colors = require('galaxyline.theme').default
local theme = require('base16').themes['tomorrow-night']

local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

gls.left[1] = {
  RainbowRed = {
    provider = function() return '▊ ' end,
    -- highlight = {colors.blue,colors.bg}
    highlight = {'#' .. theme.base0D:upper(),colors.bg}
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local modes = {
        R       = { label = 'R', color = colors.purple },
        Rv      = { label = 'R', color = colors.purple },
        S       = { label = 'S', color = colors.orange },
        V       = { label = 'V', color = colors.blue },
        ['']    = { label = 'S', color = colors.green },
        __      = { label = '-', color = colors.green },
        c       = { label = 'C', color = colors.red },
        i       = { label = 'I', color = colors.blue },
        ic      = { label = 'I', color = colors.yellow },
        ix      = { label = 'I', color = colors.green },
        n       = { label = 'N', color = colors.green },
        ni      = { label = 'N', color = colors.magenta },
        no      = { label = 'N', color = colors.magenta },
        s       = { label = 'S', color = colors.orange },
        t       = { label = 'T', color = colors.green },
        v       = { label = 'V', color = colors.magenta },
      }

      local current_mode = modes[vim.fn.mode()]
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. current_mode.color)
      return current_mode.label .. ' '
    end,
    highlight = {colors.red,colors.line_bg,'bold'},
  },
}

gls.left[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {'#' .. theme.base0D:upper(),colors.line_bg,'bold'},
  }
}

gls.left[5] = {
  Space = {
    provider = function () return ' ' end
  }
}

gls.left[6] = {
  FileIcon = {
    provider = {'FileIcon'},
    condition = buffer_not_empty,
    -- highlight = {'#' .. theme.base0D:upper(), colors.line_bg, 'bold'},
  }
}

gls.left[7] = {
  FileName = {
    provider = {'FileName'},
    condition = buffer_not_empty,
    -- highlight = {'#' .. theme.base0D:upper(), colors.line_bg, 'bold'},
    highlight = {'#' .. theme.base0D:upper(), colors.line_bg},
  }
}

-- gls.left[11] = {
--     TrailingWhiteSpace = {
--      provider = TrailingWhiteSpace,
--      icon = '  ',
--      highlight = {colors.yellow,colors.bg},
--     }
-- }

gls.left[12] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[13] = {
  Space = {
    provider = function () return ' ' end
  }
}
gls.left[14] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.right[1]= {
  FileFormat = {
    provider = 'FileFormat',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.fg,colors.line_bg,'bold'},
  }
}
gls.right[4] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {'#81A2BE',colors.line_bg,'bold'},
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    -- separator = '',
    condition = has_file_type,
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.fg,colors.purple}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    -- separator = '',
    condition = has_file_type,
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.fg,colors.purple}
  }
}
