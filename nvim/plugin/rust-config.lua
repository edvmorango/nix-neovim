-- rustaceanvim: manages rust-analyzer itself (no vim.lsp.start / vim.lsp.enable).
-- rust-analyzer binary comes from Nix $PATH.
vim.g.rustaceanvim = {
  server = {
    capabilities = require('user.lsp').make_client_capabilities(),
    default_settings = {
      ['rust-analyzer'] = {
        cargo = {
          buildScripts = { enable = true },
        },
        checkOnSave = true,
        check = { command = 'clippy' },
        procMacro = { enable = true },
      },
    },
  },
}

vim.api.nvim_create_autocmd('LspDetach', {
  group = vim.api.nvim_create_augroup('rust-lsp-detach', { clear = true }),
  pattern = { '*.rs' },
  command = 'setl foldexpr<',
})

-- crates.nvim: Cargo.toml versions/features, in-process LSP for completion/hover/actions
require('crates').setup {
  lsp = {
    enabled = true,
    actions = true,
    completion = true,
    hover = true,
  },
}
