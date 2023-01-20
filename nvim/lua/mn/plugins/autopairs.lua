return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
  },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function(_, opts)
    local autopairs = require("nvim-autopairs")
    autopairs.setup(opts)

    -- vim.g.completion_confirm_key = ""
    vim.keymap.set("i", "<CR>", autopairs.check_break_line_char, { expr = true, silent = true })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
  end,
}
