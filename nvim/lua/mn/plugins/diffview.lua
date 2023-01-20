return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewFileHistory", "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    hooks = {
      diff_buf_read = function(_)
        vim.opt_local.list = false
      end,
    },
  },
  config = function(_, opts)
    local dv = require("diffview")
    dv.setup(opts)

    vim.api.nvim_create_user_command("DiffLocal", function(state)
      vim.cmd(("DiffviewFileHistory %% --base=LOCAL --range=%s"):format(state.fargs[1]))
    end, {
      nargs = "?",
      complete = function(arg_lead, cmd_line, cur_pos)
        return require("diffview").rev_completion(arg_lead, { accept_range = true })
      end,
    })
  end,
}
