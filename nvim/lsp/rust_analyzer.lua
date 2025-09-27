return {
  autostart = true,
  cmd = { "rust-analyzer" },
  filetypes = { 'rust' },
  root_dir = function(fname)
    return vim.fs.root(fname, { "Cargo.toml", "flake.nix", ".git" })
  end,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "crate",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  }
}
