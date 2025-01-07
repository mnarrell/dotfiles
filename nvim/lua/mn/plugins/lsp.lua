return {
  -- Let Folke configure lua-language-server
  { "folke/lazydev.nvim", ft = "lua", config = true },
  {
    "neovim/nvim-lspconfig",
    event = LazyFile,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "j-hui/fidget.nvim", opts = {} },
      "b0o/schemastore.nvim",
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = false,
        -- signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true,
        signs = {
          text = {
            [vim.diagnostic.severity.INFO] = "𝓲 ",
            [vim.diagnostic.severity.HINT] = "󰛩 ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.ERROR] = " ",
            -- [vim.diagnostic.severity.INFO] = "",
            -- [vim.diagnostic.severity.HINT] = "",
            -- [vim.diagnostic.severity.WARN] = "",
            -- [vim.diagnostic.severity.ERROR] = "",
          },
          -- numhl = {
          --   [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
          --   [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
          --   [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
          --   [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
          -- },
        },
      })

      --    diagnostics = {
      --   Error = " ",
      --   Warn  = " ",
      --   Hint  = " ",
      --   Info  = " ",
      -- },

      -- local signs = { Error = "✗ ", Warn = " ", Hint = "󰛩 ", Info = "𝓲 " }
      -- for type, icon in pairs(signs) do
      --   local hl = "DiagnosticSign" .. type
      --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      -- end

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local diagnostics_enabled = true

          local toggle_diagnostics = function()
            if diagnostics_enabled then
              vim.notify("Disabling diagnostics...", vim.log.levels.INFO, { title = "LSP" })
              vim.diagnostic.enable(false)
              vim.diagnostic.reset(nil, 0)
              diagnostics_enabled = false
            else
              vim.notify("Enabling diagnostics...", vim.log.levels.INFO, { title = "LSP" })
              vim.diagnostic.enable()
              diagnostics_enabled = true
            end
          end

          local show_line_diagnostics = function()
            vim.diagnostic.open_float({
              focusable = false,
              close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              border = "rounded",
              -- border = "single",
              source = true, -- show source in diagnostic popup window
              prefix = " ",
            })
          end

          local map = function(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, { buffer = event.buf, silent = true })
          end

          -- vim.keymap.set("n", "<C-d>", "<Cmd>Telescope diagnostics<CR>", { desc = "search lsp diagnostics" })
          map("<LocalLeader>d", require("telescope.builtin").diagnostics)

          map("gD", vim.lsp.buf.declaration)
          map("<c-]>", vim.lsp.buf.definition)
          map("<C-s>", vim.lsp.buf.signature_help)
          map("<Leader>D", vim.lsp.buf.type_definition)
          map("gr", vim.lsp.buf.rename)
          map("<leader>ld", show_line_diagnostics)
          map("<Leader>ll", "<cmd>Trouble diagnostics toggle<cr>")
          map("<LocalLeader>a", vim.lsp.buf.code_action)
          map("gi", require("telescope.builtin").lsp_implementations)
          map("gf", require("telescope.builtin").lsp_references)
          map("<leader>li", require("telescope.builtin").lsp_incoming_calls)
          map("<leader>lo", require("telescope.builtin").lsp_outgoing_calls)
          map("<LocalLeader>s", require("telescope.builtin").lsp_document_symbols)
          map("<LocalLeader>w", require("telescope.builtin").lsp_dynamic_workspace_symbols)
          map("<Localleader>l", vim.lsp.codelens.run)

          map("<Leader>lf", function()
            vim.lsp.buf.format({ timeout_ms = 6000 })
          end)

          map("de", function()
            require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" })
          end)

          map("yod", toggle_diagnostics)

          vim.api.nvim_create_user_command("TH", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, {})
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local servers = {
        ansiblels = {},
        bashls = {},
        dockerls = {
          settings = {
            docker = {
              languageserver = {
                formatter = {
                  ignoreMultilineInstructions = true,
                },
              },
            },
          },
        },
        gopls = {
          cmd = { "gopls", "-remote=auto" },
          flags = {
            debounce_text_changes = 500,
          },
          settings = {
            -- buildFlags = { "tools" },
            gopls = {
              -- codelenses = {
              --   -- kttps://github.com/golang/tools/blob/master/gopls/doc/settings.md#code-lenses
              --   gc_details = true, -- Toggle the calculation of gc annotations
              --   generate = true, -- Runs go generate for a given directory
              --   regenerate_cgo = true, -- Regenerates cgo definitions
              --   test = true, -- Runs go test for a specific set of test or benchmark functions
              --   tidy = true, -- Runs go mod tidy for a module
              --   upgrade_dependency = true, -- Upgrades a dependency in the go.mod file for a module
              --   vendor = true, -- Runs go mod vendor for a module
              -- },
              -- semanticTokens = true,
              -- usePlaceholders = true,
              analyses = {
                -- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
                --   nilness = true,
                --   shadow = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
                unusedvariable = true,
              },
              staticcheck = true,
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              -- diagnosticsDelay = "500ms",
            },
          },
        },
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { disable = { "missing-fields" } },
            },
          },
        },
        -- lua_ls = {
        --   settings = {
        --     Lua = {
        --       runtime = { version = "LuaJIT" },
        --       workspace = {
        --         checkThirdParty = false,
        --         -- Tells lua_ls where to find all the Lua files that you have loaded
        --         -- for your neovim configuration.
        --         library = {
        --           "${3rd}/luv/library",
        --           unpack(vim.api.nvim_get_runtime_file("", true)),
        --         },
        --         -- If lua_ls is really slow on your computer, you can try this instead:
        --         -- library = { vim.env.VIMRUNTIME },
        --       },
        --       completion = {
        --         callSnippet = "Replace",
        --       },
        --       -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        --       diagnostics = { disable = { "missing-fields" } },
        --     },
        --   },
        -- },
        pyright = {},
        terraformls = {},
        tflint = {},
        helm_ls = {},
        yamlls = {
          -- filetypes = { "yaml" },
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              schemaStore = {
                enable = false,
                -- enable = true,
                -- url = "https://www.schemastore.org/api/json/catalog.json",
              },
              -- schemas = {
              --   ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.22.0-standalone-strict/all.json"] = "/*.k8s.yaml",
              --   ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/configmap.json"] = "*onfigma*.{yml,yaml}",
              --   ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/deployment.json"] = "*eployment*.{yml,yaml}",
              --   ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/service.json"] = "*ervic*.{yml,yaml}",
              --   ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/ingress.json"] = "*ngres*.{yml,yaml}",
              --   ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/secret.json"] = "*ecre*.{yml,yaml}",
              --   ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/statefulset.json"] = "*stateful*.{yml,yaml}",
              -- },
              schemas = require("schemastore").yaml.schemas(),
              format = { enabled = false },
              validate = true,
              completion = true,
              hover = true,
            },
          },
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
        },
      }

      require("mason").setup()

      require("mason-tool-installer").setup({
        ensure_installed = {
          "black",
          "checkmake",
          "gci",
          "isort",
          "jdtls",
          "jsonlint",
          "luacheck",
          "prettier",
          "shellcheck",
          "shfmt",
          "sqlfluff",
          "stylua",
          "yamllint",
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
