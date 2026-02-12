return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local parsers = {
      "bash",
      "comment",
      "diff",
      "dockerfile",
      "gitignore",
      "go",
      "gomod",
      "gowork",
      "helm",
      "json",
      "lua",
      "regex",
      "ruby",
      "toml",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    }

    local ts = require("nvim-treesitter")
    ts.setup()
    ts.install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function()
        vim.treesitter.start()

        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        -- vim.wo[0][0].foldmethod = "expr"
      end,
    })
  end,
}
