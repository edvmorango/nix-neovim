local metals_config = require('metals').bare_config()

metals_config.settings = {
  excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
  superMethodLensesEnabled = true,
  enableSemanticHighlighting = true,
  inlayHints = {
    byNameParameters = { enable = true },
    hintsInPatternMatch = { enable = true },
    implicitArguments = { enable = true },
    implicitConversions = { enable = true },
    inferredTypes = { enable = true },
    typeParameters = { enable = true },
  },

  serverProperties = { '-Dmetals.enable-best-effort=true', '-Xms4G', '-Xmx8G' },
  defaultBspToBuildTool = "sbt",
  startMcpServer = true,
  mcpClient = "amp"
}

metals_config.init_options.statusBarProvider = 'off'
metals_config.settings.serverVersion = '2.0.0-M8'

metals_config.on_attach = function(_client, _bufnr)
  require('metals')
  -- require('lsp-status').on_attach(client)
end

vim.api.nvim_create_autocmd('FileType', {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { 'scala', 'sbt', 'java' },
  callback = function()
    require('metals').initialize_or_attach(metals_config)
  end,
  group = vim.api.nvim_create_augroup('nvim-metals', { clear = true }),
})

--vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
