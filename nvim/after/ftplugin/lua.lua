local opt = vim.opt_local

-- opt.list = false
-- opt.expandtab = false
-- opt.tabstop = 4
-- opt.shiftwidth = 4
-- opt.softtabstop = 4
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
