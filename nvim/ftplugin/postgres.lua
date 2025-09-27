vim.lsp.start {
  name = "postgrestools",
  cmd = { 'postgrestools', 'lsp-proxy' },
  filetypes = {
    'sql',
  },
  root_markers = { 'postgrestools.jsonc' },
}
