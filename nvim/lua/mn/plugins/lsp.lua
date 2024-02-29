return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", config = true },
    opts = {
      ensure_installed = {
        "ansiblels",
        "bashls",
        "dockerls",
        "jsonls",
        "lua_ls",
        "pyright",
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
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    opts = {
      text = {
        spinner = "arc",
      },
      sources = {
        -- ["null-ls"] = { ignore = true },
      },
    },
  },
  {
    "kosayoda/nvim-lightbulb",
    -- config = function()
    --   require("nvim-lightbulb").setup({
    --     autocmd = { enabled = true },
    --   })
    -- end,
    opts = {
      autocmd = { enabled = true },
    },
  },
}
