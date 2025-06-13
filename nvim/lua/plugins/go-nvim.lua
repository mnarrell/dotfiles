return {
  "ray-x/go.nvim",
  enabled = false,
  dependencies = {
    "ray-x/guihua.lua",
    -- "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  -- enabled = false,
  config = function()
    require("go").setup({
      diagnostic = false,
      textobjects = false,
      lsp_inlay_hints = { enable = false },
    })

    -- local format_group = vim.api.nvim_create_augroup("goimports", {})
    -- vim.api.nvim.create_autocmd("BufWritePre", {
    --   pattern = "*.go",
    --   callback = function()
    --     require("go.format").goimports()
    --   end,
    --   group = format_group,
    -- })
  end,
  event = { "CmdLineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
}
