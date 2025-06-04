return {
  "saghen/blink.cmp",
  event = "VimEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "mgalliou/blink-cmp-tmux",
    "folke/lazydev.nvim",
  },
  version = "*",
  opts = {
    keymap = {
      preset = "default",
      ["<C-k>"] = {}, -- my snippets
    },

    completion = {
      menu = {
        border = "rounded",
        scrollbar = false,
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "kind_icon", gap = 1 },
            { "label", gap = 4 },
            { "kind", "source_name", gap = 1 },
            { "label_description", gap = 1 },
          },
          -- gap = 1,
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = {
          border = "rounded",
          max_width = math.floor(vim.o.columns * 0.4),
          max_height = math.floor(vim.o.lines * 0.5),
        },
      },

      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
    },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
      kind_icons = require("icons").symbol_kinds,
    },

    snippets = { preset = "luasnip" },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = { enabled = true, window = { border = "rounded" } },

    cmdline = {
      completion = {
        menu = {
          draw = {
            columns = {
              { "kind_icon", gap = 1 },
              { "label", gap = 4 },
            },
          },
        },
      },
    },

    sources = {
      -- default = { "lazydev", "lsp", "path", "snippets", "buffer", "tmux", "copilot" },
      default = { "lazydev", "lsp", "path", "snippets", "buffer", "tmux" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100, -- show at a higher priority than lsp
        },
        snippets = { score_offset = 5 },
        lsp = { score_offset = 4 },
        path = { score_offset = 3 },
        buffer = { score_offset = 2 },
        tmux = {
          module = "blink-cmp-tmux",
          name = "tmux",
          score_offset = 1,
          min_keyword_length = 4,
          opts = {
            all_panes = true,
            -- capture_history = false,
            -- triggered_only = false,
            -- triggered_only = true,
            -- trigger_chars = { "\\" },
          },
        },
      },
    },
  },
}
