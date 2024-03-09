return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.expand("$XDG_DATA_HOME/jdtls/" .. project_name)
      local jar_path =
        vim.fn.expand("$XDG_DATA_HOME/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")
      local configuration_path = vim.fn.expand("$XDG_DATA_HOME/nvim/mason/packages/jdtls/config_mac_arm")
      local config = {
        -- The command that starts the language server
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",

          "-jar",
          jar_path,

          "-configuration",
          configuration_path,

          "-data",
          workspace_dir,
        },

        -- Here you can configure eclipse.jdt.ls specific settings
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- for a list of options
        settings = {
          java = {
            format = { enabled = false },
            signatureHelp = { enabled = true },
          },
        },

        -- Language server `initializationOptions`
        -- You need to extend the `bundles` with paths to jar files
        -- if you want to use additional eclipse.jdt.ls plugins.
        --
        -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
        --
        -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
        init_options = {
          bundles = {},
        },
      }
      -- This starts a new client & server,
      -- or attaches to an existing client & server depending on the `root_dir`.
      require("jdtls").start_or_attach(config)
    end,
  },
}
