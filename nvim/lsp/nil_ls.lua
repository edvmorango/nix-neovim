return {
  autostart = true,
  cmd = { "nil" },
  settings = {
    ['nil'] = {
      testSetting = 42,
      formatting = {
        command = { 'alejandra' },
      },
    },
  },
  filetypes = { 'nix' },
  root_pattern = { 'flake.nix', '.git' }
}
