local condition = require('galaxyline.condition')
local ale = require('plugins.galaxyline.provider_ale')
local colors = require('galaxyline.theme').default
local theme = require('base16-colorscheme').colorschemes['tomorrow-night']
local gl = require('galaxyline')
local gls = gl.section

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gl.short_line_list = {'NvimTree','vista','dbui','packer'}

local modes = {
  R       = { label = 'R', color = colors.purple },
  Rv      = { label = 'R', color = colors.purple },
  S       = { label = 'S', color = colors.orange },
  V       = { label = 'V', color = colors.blue },
  ['']  = { label = 'V', color = colors.blue },
  ['']    = { label = 'S', color = colors.green },
  __      = { label = '-', color = colors.green },
  c       = { label = 'C', color = colors.red },
  i       = { label = 'I', color = colors.blue },
  ic      = { label = 'I', color = colors.yellow },
  ix      = { label = 'I', color = colors.green },
  n       = { label = 'N', color = colors.green },
  ni      = { label = '',  color = colors.magenta },
  no      = { label = 'N', color = colors.magenta },
  s       = { label = 'S', color = colors.orange },
  t       = { label = 'T', color = colors.green },
  v       = { label = 'V', color = colors.magenta },
}

gls.left[1] = {
  RainbowRed = {
    provider = function() return '▊' end,
    separator = ' ',
    highlight = {theme.base0D:upper(),colors.bg}
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local current_mode = modes[vim.fn.mode()]
      vim.api.nvim_command('hi GalaxyViMode gui=bold guifg=' .. current_mode.color)
      return current_mode.label .. ' '
    end,
  },
}

gls.left[3] = {
  GitIcon = {
    condition = condition.check_git_workspace,
    highlight = {colors.orange,colors.line_bg},
    provider = function() return '' end,
    separator = ' ',
  },
}

gls.left[4] = {
  GitBranch = {
    condition = condition.check_git_workspace,
    highlight = {theme.base0D:upper(),colors.line_bg,'bold'},
    provider = 'GitBranch',
    separator = ' ',
  },
}


gls.left[5] = {
  FileName = {
    condition = buffer_not_empty,
    highlight = {theme.base0D:upper(), colors.line_bg},
    provider = function() return vim.fn.expand("%") end,
  }
}

gls.left[6] = {
  DiagnosticError = {
    highlight = {colors.red,colors.bg},
    icon = '  ',
    provider = 'DiagnosticError',
  }
}

gls.left[7] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[8] = {
  GolangStatusline = {
    provider = function() return vim.fn['go#statusline#Show']() end,
    condition = function()
      return 'go' == vim.bo.filetype
    end,
  }
}

gls.right[1]= {
  FileFormat = {
    provider = function() return vim.bo.filetype end,
    highlight = {theme.base0D:upper(), colors.line_bg},
  },
}

gls.right[2]= {
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {theme.base0D:upper(), colors.line_bg},
    separator = ' ',
  },
}

gls.right[3] = {
  PositionInfo = {
    provider = function()
      return string.format(' %s:%s ', vim.fn.line('.'), vim.fn.col('.'))
    end,
    highlight = {theme.base0D:upper()},
    condition = buffer_not_empty,
    separator = ' ',
  }
}

gls.right[4] = {
  Warnings = {
    provider = ale.warnings,
    condition = ale.check_warnings,
    separator = ' ',
    highlight = {colors.yellow},
  },
  Errors = {
    provider = ale.errors,
    condition = ale.check_errors,
    separator = ' ',
    highlight = {colors.red},
  },
}

gls.right[4] = {
  WhiteSpace = {
    -- condition = condition.check_git_workspace,
    -- highlight = {theme.base0D:upper(),colors.line_bg,'bold'},
    provider = 'WhiteSpace',
    separator = ' ',
  },
}

gls.short_line_left[1] = {
  RainbowRed = {
    provider = function() return '▊' end,
    separator = ' ',
    highlight = {theme.base0D:upper(),colors.bg}
  },
}

gls.short_line_left[2] = {
  FileName = {
    condition = buffer_not_empty,
    highlight = {theme.base0D:upper(), colors.line_bg},
    provider = function() return vim.fn.expand("%") end,
  }
}

vim.api.nvim_exec([[
  augroup ale_refresh
    autocmd!
    autocmd User ALEJobStarted,ALELintPost lua require("galaxyline").load_galaxyline()
    autocmd FocusGained * lua require("galaxyline").load_galaxyline()
  augroup END
]], false)
