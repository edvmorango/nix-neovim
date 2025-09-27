---@type vim.lsp.Config
vim.lsp.start {
  name = "docker-compose-langserver",
  cmd = { 'docker-compose-langserver', '--stdio' },
  filetypes = { 'yaml.docker-compose' },
  single_file_support = true,
}
