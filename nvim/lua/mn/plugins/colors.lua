return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    init = function()
      vim.cmd("colorscheme kanagawa-dragon")
      vim.api.nvim_set_hl(0, "@string.special.url", { underline = true, fg = "#949fb5" })

      -- Customization for Pmenu
      -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
      -- vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

      -- vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
      -- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
      -- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
      -- vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB" })
    end,
    config = function()
      require("kanagawa").setup({
        -- compile = true,
        -- functionStyle = { bold = true },
        -- dimInactive = true,
        overrides = function(colors)
          local theme = colors.theme
          return {
            --     NormalFloat = { bg = "none" },
            --     FloatBorder = { bg = "none" },
            --     FloatTitle = { bg = "none" },
            --
            --     -- Save an hlgroup with dark background and dimmed foreground
            --     -- so that you can use it where your still want darker windows.
            --     -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            --     NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            --
            --     -- Popular plugins that open floats will link to NormalFloat by default;
            --     -- set their background accordingly if you wish to keep them dark and borderless
            --     LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            --     MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            --
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
            -- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
      })
    end,
  },
  {
    "echasnovski/mini.base16",
    enabled = false,
    version = false,
    config = function()
      require("mini.base16").setup({
        palette = {
          base00 = "#1d1f21",
          base01 = "#282a2e",
          base02 = "#373b41",
          base03 = "#969896",
          base04 = "#b4b7b4",
          base05 = "#c5c8c6",
          base06 = "#e0e0e0",
          base07 = "#ffffff",
          base08 = "#cc6666",
          base09 = "#de935f",
          base0A = "#f0c674",
          base0B = "#b5bd68",
          base0C = "#8abeb7",
          base0D = "#81a2be",
          base0E = "#b294bb",
          base0F = "#a3685a",
        },
        use_cterm = true,
      })
    end,
  },
}
