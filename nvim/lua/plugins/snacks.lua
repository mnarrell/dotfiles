return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {
      enabled = true,
      ui_select = true, -- Enables snacks as the replacement for vim.ui.select
      sources = {
        buffers = {
          layout = {
            preset = "select",
            preview = false,
          },
        },
      },
    },
  },
  keys = {
    -- stylua: ignore start
    { "<leader>b", function() Snacks.picker.buffers() end, },
    { "<leader>gf", function() Snacks.picker.git_status() end, },
    { "<leader>f", function() Snacks.picker.files({ hidden = true }) end, },
    { "<leader>m", function() Snacks.picker.marks() end, },
    { "<leader>/", function() Snacks.picker.grep() end, },
    { "<LocalLeader>h", function() Snacks.picker.help() end, },
    { "q;", function() Snacks.picker.command_history() end, },
    { "q/", function() Snacks.picker.search_history() end, },
    -- stylua: ignore end
  },
  init = function()
    local cmd = function(lhs, rhs, opts)
      opts = vim.tbl_extend("force", { bang = true }, opts or {})
      vim.api.nvim_create_user_command(lhs, rhs, opts)
    end

    cmd("GL", function()
      Snacks.picker.git_log_file()
    end)

    cmd("Reg", function()
      Snacks.picker.registers()
    end)

    cmd("GB", function()
      Snacks.gitbrowse()
    end)
  end,
}
