return {
  autostart = true,
  cmd = { "css-variables-language-server", "--stdio" },
  settings = {
    cssVariables = {
      blacklistFolders = { "**/.cache", "**/.DS_Store", "**/.git", "**/.hg", "**/.next", "**/.svn", "**/bower_components", "**/CVS", "**/dist", "**/node_modules", "**/tests", "**/tmp" },
      lookupFiles = { "**/*.less", "**/*.scss", "**/*.sass", "**/*.css" }
    }
  },
  filetypes = { "css", "scss", "less" },
  root_markers = { 'flake.nix', '.git', "package.json" }
}
