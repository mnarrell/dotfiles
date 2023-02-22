return {
  "hrsh7th/nvim-cmp",
  -- event = "BufReadPre",
  event = {
    "CmdlineEnter",
    "InsertEnter",
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-omni",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "andersevenrud/cmp-tmux",
    "onsails/lspkind-nvim",
    "L3MON4D3/LuaSnip",
  },
  opts = function()
    local cmp = require("cmp")

    return {
      formatting = {
        format = require("lspkind").cmp_format({
          with_text = false,
          menu = {
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            nvim_lua = "[Lua]",
            path = "[Path]",
            buffer = "[Buffer]",
            emoji = "[Emoji]",
            omni = "[omni]",
            tmux = "[tmux]",
            nvim_lsp_document_symbol = "[Syms]",
          },
        }),
      },

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      window = {
        documentation = cmp.config.window.bordered(),
      },

      -- completion = {
      --   keyword_length = 1,
      --   completeopt = "menu,noselect",
      --   -- autocomplete = false,
      -- },

      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
          cmp.config.compare.score,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-X><C-O>"] = cmp.mapping.complete(),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({
          -- behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }, { "i", "c" }),
        ["<c-q>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length = 2 },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "nvim_lsp_document_symbol" },
        { name = "path" },
        { name = "tmux" },
      }),

      experimental = {
        -- I like the new menu better! Nice work hrsh7th
        native_menu = false,

        -- Let's play with this for a day or two
        ghost_text = false,
      },
    }
  end,
}
