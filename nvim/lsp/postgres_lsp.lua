return {
  autostart = true,
  cmd = { 'postgrestools', 'lsp-proxy' },
  filetypes = { 'sql' },
  single_file_support = true,
  root_pattern = { 'flake.nix', '.git', 'postgrestools.jsonc' },
}
