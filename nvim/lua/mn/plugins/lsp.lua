return {
  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      { "williamboman/mason.nvim" },
    },
    opts = {
      ensure_installed = {
        "ansiblels",
        "bashls",
        "dockerls",
        "pyright",
        "lua_ls",
        "terraformls",
        "tflint",
        "yamlls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = { "hrsh7th/nvim-cmp", "mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mn.lsp")
    end,
  },
  { "j-hui/fidget.nvim", config = true },
}
