local signs = require("icons").signs

return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    opts = {
      ui = {
        icons = {
          package_installed = signs.PassCheck,
          package_pending = signs.Running,
          package_uninstalled = signs.GitRemoved,
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "ansible-language-server",
        "bash-language-server",
        "dockerfile-language-server",
        "gopls",
        "helm-ls",
        "json-lsp",
        "lua-language-server",
        "terraform-ls",
        "tflint",
        "yaml-language-server",
      },
    },
  },
}
