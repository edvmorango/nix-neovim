-- Telescope "command center" for rustaceanvim / crates.nvim,
-- mirroring telescope.extensions.metals.commands.
local M = {}

local function rust_lsp(args)
  return function()
    vim.cmd('RustLsp ' .. args)
  end
end

local function rust_analyzer(args)
  return function()
    vim.cmd('RustAnalyzer ' .. args)
  end
end

local function crates(fn)
  return function()
    require('crates')[fn]()
  end
end

M.rust_commands = {
  -- server
  { 'Restart server', 'RustAnalyzer restart', rust_analyzer('restart') },
  { 'Start server', 'RustAnalyzer start', rust_analyzer('start') },
  { 'Stop server', 'RustAnalyzer stop', rust_analyzer('stop') },
  { 'Reload settings', 'RustAnalyzer reloadSettings', rust_analyzer('reloadSettings') },
  { 'Set target triple', 'RustAnalyzer target', function()
    vim.ui.input({ prompt = 'Target triple (empty = default): ' }, function(t)
      if t ~= nil then vim.cmd('RustAnalyzer target ' .. t) end
    end)
  end },
  { 'Rebuild proc macros', 'RustLsp rebuildProcMacros', rust_lsp('rebuildProcMacros') },
  { 'Fly check (run)', 'RustLsp flyCheck run', rust_lsp('flyCheck run') },
  { 'Fly check (clear)', 'RustLsp flyCheck clear', rust_lsp('flyCheck clear') },
  { 'Fly check (cancel)', 'RustLsp flyCheck cancel', rust_lsp('flyCheck cancel') },
  { 'Open LSP log', 'RustLsp logFile', rust_lsp('logFile') },
  -- run / test / debug
  { 'Runnables', 'RustLsp runnables', rust_lsp('runnables') },
  { 'Rerun last runnable', 'RustLsp! runnables', function() vim.cmd('RustLsp! runnables') end },
  { 'Testables', 'RustLsp testables', rust_lsp('testables') },
  { 'Rerun last testable', 'RustLsp! testables', function() vim.cmd('RustLsp! testables') end },
  { 'Debuggables', 'RustLsp debuggables', rust_lsp('debuggables') },
  -- code
  { 'Code action (grouped)', 'RustLsp codeAction', rust_lsp('codeAction') },
  { 'Hover actions', 'RustLsp hover actions', rust_lsp('hover actions') },
  { 'Expand macro', 'RustLsp expandMacro', rust_lsp('expandMacro') },
  { 'Explain error', 'RustLsp explainError', rust_lsp('explainError') },
  { 'Render diagnostic', 'RustLsp renderDiagnostic', rust_lsp('renderDiagnostic') },
  { 'Related diagnostics', 'RustLsp relatedDiagnostics', rust_lsp('relatedDiagnostics') },
  { 'Join lines', 'RustLsp joinLines', rust_lsp('joinLines') },
  { 'Move item up', 'RustLsp moveItem up', rust_lsp('moveItem up') },
  { 'Move item down', 'RustLsp moveItem down', rust_lsp('moveItem down') },
  { 'Structural search & replace', 'RustLsp ssr', rust_lsp('ssr') },
  { 'Workspace symbol', 'RustLsp workspaceSymbol', rust_lsp('workspaceSymbol') },
  -- navigation
  { 'Open Cargo.toml', 'RustLsp openCargo', rust_lsp('openCargo') },
  { 'Parent module', 'RustLsp parentModule', rust_lsp('parentModule') },
  { 'Open docs.rs', 'RustLsp openDocs', rust_lsp('openDocs') },
  -- inspect
  { 'Crate graph', 'RustLsp crateGraph', rust_lsp('crateGraph') },
  { 'Syntax tree', 'RustLsp syntaxTree', rust_lsp('syntaxTree') },
  { 'View HIR', 'RustLsp view hir', rust_lsp('view hir') },
  { 'View MIR', 'RustLsp view mir', rust_lsp('view mir') },
}

M.cargo_commands = {
  { 'Crate info popup', 'crates.show_popup', crates('show_popup') },
  { 'Versions popup', 'crates.show_versions_popup', crates('show_versions_popup') },
  { 'Features popup', 'crates.show_features_popup', crates('show_features_popup') },
  { 'Dependencies popup', 'crates.show_dependencies_popup', crates('show_dependencies_popup') },
  { 'Update crate', 'crates.update_crate', crates('update_crate') },
  { 'Upgrade crate', 'crates.upgrade_crate', crates('upgrade_crate') },
  { 'Update all crates', 'crates.update_all_crates', crates('update_all_crates') },
  { 'Upgrade all crates', 'crates.upgrade_all_crates', crates('upgrade_all_crates') },
  { 'Expand to inline table', 'crates.expand_plain_crate_to_inline_table', crates('expand_plain_crate_to_inline_table') },
  { 'Open crates.io', 'crates.open_crates_io', crates('open_crates_io') },
  { 'Open documentation', 'crates.open_documentation', crates('open_documentation') },
  { 'Open repository', 'crates.open_repository', crates('open_repository') },
  { 'Reload crates data', 'crates.reload', crates('reload') },
  -- server still useful from Cargo.toml
  { 'Restart rust-analyzer', 'RustAnalyzer restart', rust_analyzer('restart') },
  { 'Rebuild proc macros', 'RustLsp rebuildProcMacros', rust_lsp('rebuildProcMacros') },
}

function M.commands(opts, list, title)
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local conf = require('telescope.config').values
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')

  pickers
    .new(opts or {}, {
      prompt_title = title or 'Rust Commands',
      finder = finders.new_table {
        results = list or M.rust_commands,
        entry_maker = function(item)
          return {
            value = item,
            display = string.format('%-30s %s', item[1], item[2]),
            ordinal = item[1] .. ' ' .. item[2],
          }
        end,
      },
      sorter = conf.generic_sorter(opts or {}),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          if entry then entry.value[3]() end
        end)
        return true
      end,
    })
    :find()
end

return M
