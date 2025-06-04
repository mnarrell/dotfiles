-- Improved quickfix UI.
return {
  {
    "stevearc/quicker.nvim",
    event = "VeryLazy",
    opts = {
      borders = {
        -- Thinner separator.
        vert = require("icons").misc.vertical_bar,
      },
    },
  },
}
