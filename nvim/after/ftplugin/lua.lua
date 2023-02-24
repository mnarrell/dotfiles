local opt = vim.opt_local

opt.equalprg = [[stylua -]]

-- Disable inserting comment leader after hitting o or O or <Enter>
opt.formatoptions:remove("o")
opt.formatoptions:remove("r")

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
