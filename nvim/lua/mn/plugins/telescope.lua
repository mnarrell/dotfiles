return {
  "nvim-telescope/telescope.nvim",
  -- event = "VeryLazy",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  opts = function()
    local actions = require("telescope.actions")
    local my_maps = {
      ["<C-a>"] = actions.select_all,
      ["<C-x>"] = false,
      ["<C-s>"] = actions.select_horizontal,
      ["<C-y>"] = actions.send_selected_to_loclist,
      ["<C-d>"] = actions.delete_buffer,
      -- ["<tab>"] = actions.toggle_selection,
      ["<esc>"] = actions.close,
    }

    return {
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
    }
  end,
  keys = {
    { "<leader>b", ":lua require('telescope.builtin').buffers()<CR>", silent = true },
    { "<leader>gf", ":lua require('telescope.builtin').git_status()<CR>", silent = true },
    { "<leader>f", ":lua require('telescope.builtin').find_files()<CR>", silent = true },
    { "<leader>m", ":lua require('telescope.builtin').marks()<CR>", silent = true },
    { "<leader>r", ":lua require('telescope.builtin').live_grep()<CR>", silent = true },
    { "<leader>h", ":lua require('telescope.builtin').help_tags()<CR>", silent = true },
  },
  config = function(_, opts)
    local tele = require("telescope")
    tele.setup(opts)
    tele.load_extension("ui-select")

    local find_hidden = function()
      require("telescope.builtin").find_files({
        find_command = { "fd", "--type", "f", "--hidden", "--no-ignore-vcs", "--strip-cwd-prefix", "--follow" },
      })
    end
    vim.api.nvim_create_user_command("FH", find_hidden, { bang = true })
  end,
}
