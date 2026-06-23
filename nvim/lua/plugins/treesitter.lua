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
      "gotmpl",
      "gowork",
      "hcl",
      "helm",
      "json",
      "lua",
      "regex",
      "ruby",
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

    -- Start treesitter for any buffer whose language has a parser available,
    -- not just the statically-installed set above (covers parsers added later
    -- and filetypes that map to an installed language).
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
          return
        end

        -- `add` returns nil (or errors on older versions) when no parser is
        -- installed for the language; guard both cases.
        local ok, added = pcall(vim.treesitter.language.add, lang)
        if not (ok and added) then
          return
        end

        if not pcall(vim.treesitter.start, args.buf) then
          return
        end

        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
