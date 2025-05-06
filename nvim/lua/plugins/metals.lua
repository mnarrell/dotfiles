return {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = { "scala", "sbt" },
  opts = function()
    local metals_config = require("metals").bare_config()
    local support = require("mn.lsp.support")
    metals_config.on_attach = support.on_attach
    metals_config.capabilities = support.capabilities()

    return metals_config
  end,
  keys = {
    { "<leader>lmc", ":lua require('telescope').extensions.metals.commands()<CR>", silent = true },
  },
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
