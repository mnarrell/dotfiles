return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "mrjones2014/nvim-ts-rainbow",
    { "windwp/nvim-ts-autotag", config = true },
  },
  opts = {
    ensure_installed = {
      "bash",
      "comment",
      "dockerfile",
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
      "yaml",
    },
    sync_install = false,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true,
      disable = { "yaml", "go" },
    },

    custom_captures = {
      ["comment"] = "Comment",
    },

    rainbow = {
      enable = true,
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },

    context_commentstring = { enable = true },

    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- ["af"] = "@function.outer",
          -- ["if"] = "@function.inner",
          -- ["ac"] = "@class.outer",
          -- ["ic"] = "@class.inner",
          -- ["ab"] = "@block.outer",
          -- ["ib"] = "@block.inner",
          -- ["aa"] = "@parameter.outer",
          -- ["ia"] = "@parameter.inner",
        },
      },
    },

    autopairs = { enable = true },
    autotag = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
