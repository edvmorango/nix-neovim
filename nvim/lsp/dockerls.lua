---@type vim.lsp.Config
return {
  cmd = { 'docker-langserver', '--stdio' },
  settings = {
    docker = {
      languageserver = {
        formatter = {
          ignoreMultilineInstructions = true,
        },
      },
    },
  },
  filetypes = { 'dockerfile' },
  single_file_support = true,
}
