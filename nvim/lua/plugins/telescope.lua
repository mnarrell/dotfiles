return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  enabled = false,
  -- branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local actions = require("telescope.actions")
    local open_with_trouble = require("trouble.sources.telescope").open

    local my_maps = {
      ["<C-a>"] = actions.select_all,
      ["<C-x>"] = false,
      ["<C-s>"] = actions.select_horizontal,
      ["<C-y>"] = actions.send_selected_to_qflist,
      ["<C-d>"] = actions.delete_buffer,
      ["<esc>"] = actions.close,
      ["<C-b>"] = open_with_trouble,
    }

    require("telescope").setup({
      defaults = {
        mappings = {
          i = my_maps,
          n = my_maps,
        },
        file_ignore_patterns = { "vendor" },
      },
      pickers = {
        lsp_references = {
          fname_width = 100,
        },
        lsp_document_symbols = {
          symbol_width = 60,
        },
        find_files = {
          find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
        },
        help_tags = {
          layout_config = {
            prompt_position = "top",
            preview_width = 0.75,
            height = 0.6,
          },
          preview = {
            preview_cutoff = 120,
            preview_width = 80,
            hide_on_startup = false,
          },
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- local builtin = require "telescope.builtin"
    -- vim.keymap.set("n", "<leader>b", builtin.buffers)
    -- vim.keymap.set("n", "<leader>gf", builtin.git_status)
    -- vim.keymap.set("n", "<leader>f", builtin.find_files)
    -- vim.keymap.set("n", "<leader>m", builtin.marks)
    -- vim.keymap.set("n", "<leader>/", builtin.live_grep)
    -- vim.keymap.set("n", "<LocalLeader>h", builtin.help_tags)
    -- vim.keymap.set("n", "<leader>r", function()
    --   -- You can pass additional configuration to telescope to change theme, layout, etc.
    --   builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    --     winblend = 10,
    --     previewer = false,
    --   })
    -- end)
    -- vim.keymap.set("n", "q;", builtin.command_history) -- I have no idea why I cant override `q:`
    -- vim.keymap.set("n", "q/", builtin.search_history)

    local find_hidden = function()
      require("telescope.builtin").find_files({
        find_command = { "fd", "--type", "f", "--hidden", "--no-ignore-vcs", "--strip-cwd-prefix", "--follow" },
      })
    end
    vim.api.nvim_create_user_command("FH", find_hidden, { bang = true })
  end,
}
