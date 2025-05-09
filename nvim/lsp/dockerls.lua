---@brief
---
--- https://github.com/rcjsuen/dockerfile-language-server-nodejs
---
--- `docker-langserver` can be installed via `npm`:
--- ```sh
--- npm install -g dockerfile-language-server-nodejs
--- ```

---@type vim.lsp.Config
return {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile" },
  root_markers = { "Dockerfile" },
  settings = {
    docker = {
      languageserver = {
        formatter = {
          ignoreMultilineInstructions = true,
        },
      },
    },
  },
}
