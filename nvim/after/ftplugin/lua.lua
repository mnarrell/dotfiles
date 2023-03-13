local opt = vim.opt_local

opt.equalprg = [[stylua -]]

local cmp = require("cmp")
cmp.setup.buffer({
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer", keyword_length = 2 },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "tmux" },
  }),
})
