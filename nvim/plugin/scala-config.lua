local metals_config = require('metals').bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
  showInferredType = true,
  superMethodLensesEnabled = true,
  enableSemanticHighlighting = true,
  serverProperties = { '-Dmetals.enable-best-effort=true', '-Xms4G', '-Xmx8G',
    "-Djol.magicFieldOffset=true",
    "-Djol.tryWithSudo=true",
    "-Djdk.attach.allowAttachSelf",
    "--add-opens=java.base/java.nio=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.comp=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.jvm=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.main=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.model=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.processing=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.resources=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED",
    "--add-exports=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
    "--add-opens=java.base/sun.nio.ch=ALL-UNNAMED",
    "--add-opens=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED",
    "--add-opens=jdk.compiler/com.sun.tools.javac.comp=ALL-UNNAMED",
    "--add-opens=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED",
    "--add-opens=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED",
    "-XX:+DisplayVMOutputToStderr",
    "-Xlog:disable",
    "-Xlog:all=warning,gc=warning:stderr",
  },
  defaultBspToBuildTool = "sbt",
  startMcpServer = "true"
}

metals_config.init_options.statusBarProvider = 'off'
metals_config.settings.serverVersion = '2.0.0-M7'
-- Example if you are using cmp how to make sure the correct capabilities for snippets are set

-- local capabilities = require('coq').lsp_ensure_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- metals_config.capabilities = capabilities

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
