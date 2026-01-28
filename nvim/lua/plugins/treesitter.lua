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
      "elixir",
      "gitignore",
      "go",
      "gomod",
      "gowork",
      "hcl",
      "http",
      "java",
      "json",
      "jsonc",
      "lua",
      "make",
      "python",
      "regex",
      "ruby",
      "scala",
      "terraform",
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
      end,
    })
  end,
}
