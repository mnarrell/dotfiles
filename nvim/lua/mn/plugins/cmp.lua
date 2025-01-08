return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-omni",
    "andersevenrud/cmp-tmux",
    "onsails/lspkind-nvim",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
            cmdline = "[CMD]",
          },
        }),
      },

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      completion = { completeopt = "menu,noselect,noinsert" },

      window = { documentation = { border = "rounded" } },

      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-X><C-O>"] = cmp.mapping.complete(),
        -- ["<c-q>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      },

      sources = {
        -- { name = "copilot" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        -- { name = "buffer", keyword_length = 2 },
        { name = "buffer" },
        { name = "path" },
        { name = "tmux" },
      },
    })
  end,
}
