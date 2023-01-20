return {
  { "christoomey/vim-sort-motion", event = "InsertEnter" },
  {
    "arsham/indent-tools.nvim",
    event = "InsertEnter",
    dependencies = { "arsham/arshlib.nvim" },
    config = true,
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "InsertEnter",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
  },
}
