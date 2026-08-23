---@brief
---
--- https://github.com/ansible/vscode-ansible
---
--- Language server for the ansible configuration management tool.
---
--- `ansible-language-server` can be installed via `npm`:
---
--- ```sh
--- npm install -g @ansible/ansible-language-server
--- ```
return {
  cmd = { "ansible-language-server", "--stdio" },
  settings = {
    ansible = {
      python = {
        -- python3, not python: Homebrew's python@3.14 (which ansible itself
        -- depends on) ships python3 but no unversioned python shim.
        interpreterPath = "python3",
      },
      ansible = {
        path = "ansible",
      },
      executionEnvironment = {
        enabled = false,
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = "ansible-lint",
        },
      },
    },
  },
  filetypes = { "yaml.ansible" },
  root_markers = { "ansible.cfg", ".ansible-lint" },
}
