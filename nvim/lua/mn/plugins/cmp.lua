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

      completion = {
        keyword_length = 1,
        completeopt = "menu,noselect",
        -- autocomplete = false,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-X><C-O>"] = cmp.mapping.complete(),
        -- ["<C-y>"] = cmp.mapping.confirm({
        --   behavior = cmp.ConfirmBehavior.Insert,
        --   select = false,
        -- }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "buffer", keyword_length = 4 },
        { name = "omni" },
        { name = "nvim_lsp_document_symbol" },
        { name = "tmux", keyword_length = 4 },
      }),
    }
  end,
}
