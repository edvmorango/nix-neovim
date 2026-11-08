if vim.fn.executable('rust-analyzer') ~= 1 then
  vim.notify('rust-analyzer not found in $PATH', vim.log.levels.WARN)
  return
end

vim.lsp.start {
  name = "rust-analyzer",
  cmd = { "rust-analyzer" }, -- from Nix $PATH
  root_dir = vim.fs.root(0, { "Cargo.toml", "flake.nix", ".git" }),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        buildScripts = { enable = true },
      },
      checkOnSave = true,
      check = { command = "clippy" },
      procMacro = { enable = true },
    },
  }
}
