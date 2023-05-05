return {
  "hrsh7th/nvim-cmp",
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
    "andersevenrud/cmp-tmux",
    "onsails/lspkind-nvim",
    "L3MON4D3/LuaSnip",
  },
  opts = function()
    local cmp = require("cmp")

    return {
      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol",
          preset = "codicons",
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
          -- symbol_map = {
          --   Text = "",
          --   Method = "",
          --   Function = "",
          --   Constructor = "",
          --   Field = "ﰠ",
          --   Variable = "",
          --   Class = "ﴯ",
          --   Interface = "",
          --   Module = "",
          --   Property = "ﰠ",
          --   Unit = "塞",
          --   Value = "",
          --   Enum = "",
          --   Keyword = "",
          --   Snippet = "",
          --   Color = "",
          --   File = "",
          --   Reference = "",
          --   Folder = "",
          --   EnumMember = "",
          --   Constant = "",
          --   Struct = "פּ",
          --   Event = "",
          --   Operator = "",
          --   TypeParameter = "",
          -- },
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
        -- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({
          -- behavior = cmp.ConfirmBehavior.Insert,
          select = false,
        }, { "i", "c" }),
        ["<c-q>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
      }, { { name = "luasnip" } }, {
        { name = "buffer", keyword_length = 2 },
        { name = "path" },
        { name = "tmux" },
      }),

      -- sources = cmp.config.sources({
      --   { name = "nvim_lsp" },
      --   { name = "vsnip" }, -- For vsnip users.
      --   { name = "luasnip" }, -- For luasnip users.
      --   -- { name = 'ultisnips' }, -- For ultisnips users.
      --   -- { name = 'snippy' }, -- For snippy users.
      -- }, {
      --   { name = "buffer" },
      -- }),

      experimental = {
        native_menu = false,
        ghost_text = false,
      },
    }
  end,
}
