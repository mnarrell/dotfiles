return {
  "saghen/blink.cmp",
  -- lazy = false, -- lazy loading handled internally
  event = "VimEnter",
  dependencies = {
    { "L3MON4D3/LuaSnip" },
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
          -- treesitter = { "lsp" },
          -- columns = {
          --   { "label", "label_description", gap = 1 },
          --   { "kind_icon", "kind" },
          --   { "source_name" },
          -- },
          treesitter = { "lsp" },
          columns = {
            { "kind_icon", gap = 1 },
            { "label", gap = 4 },
            { "kind", "source_name" },
            { "label_description" },
          },
          -- gap = 1,
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = {
          border = "rounded",
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
    },

    snippets = { preset = "luasnip" },

    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer", "tmux" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100, -- show at a higher priority than lsp
        },
        snippets = { min_keyword_length = 3, score_offset = 5 },
        lsp = { min_keyword_length = 4, score_offset = 4 },
        path = { score_offset = 3 },
        buffer = { min_keyword_length = 5, score_offset = 2 },
        tmux = {
          module = "blink-cmp-tmux",
          name = "tmux",
          score_offset = 1,
          -- default options
          opts = {
            all_panes = false,
            capture_history = false,
            -- only suggest completions from `tmux` if the `trigger_chars` are
            -- used
            triggered_only = false,
            trigger_chars = { "." },
          },
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = { enabled = true, window = { border = "rounded" } },
  },
}
