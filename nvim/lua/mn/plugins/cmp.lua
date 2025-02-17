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
    -- local lspkind = require("lspkind")

    cmp.setup({
      -- formatting = {
      --   format = lspkind.cmp_format({
      --     mode = "symbol_text",
      --     menu = {
      --       buffer = "[Buffer]",
      --       nvim_lsp = "[LSP]",
      --       lazydev = "[LazyDev]",
      --       luasnip = "[LuaSnip]",
      --       nvim_lua = "[Lua]",
      --       latex_symbols = "[Latex]",
      --       cmdline = "[CMD]",
      --     },
      --   }),
      -- },

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      completion = { completeopt = "menu,noselect,noinsert" },

      window = {
        documentation = { border = "rounded" },
        completion = {
          border = "rounded",
          -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          -- col_offset = -3,
          scrollbar = false,
          side_padding = 0,
        },
      },

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
        { name = "lazydev", group_index = 0 },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer" },
        { name = "path" },
        -- { name = "tmux" },
      },
    })
  end,
}
