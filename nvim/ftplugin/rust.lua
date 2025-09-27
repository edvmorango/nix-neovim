vim.lsp.start {
  name = "rust-analyzer",
  cmd = { "rust-analyzer" }, -- from Nix $PATH
  root_dir = vim.fs.root(0, { "Cargo.toml", "flake.nix", ".git" }),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        buildScripts = { enable = true },
      },
      checkOnSave = { command = "clippy" },
      procMacro = { enable = true },
    },
  }
}
