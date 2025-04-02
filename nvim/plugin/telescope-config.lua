local builtin = require('telescope.builtin')

local telescope = require('telescope')

local notify = require('notify')

notify.setup()

local trouble = require('trouble')

trouble.setup()

local nvim_web_devicons = require('nvim-web-devicons')

nvim_web_devicons.setup {
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = '',
      color = '#428850',
      name = 'Zsh',
    },
  },
  default = true,
}

local actions_preview = require('actions-preview')

actions_preview.setup {
  telescope = {
    sorting_strategy = 'ascending',
    layout_strategy = 'vertical',
    layout_config = TelescopeLayoutConfigVertical,
  },
}

--require('telescope').load_extension('hoogle')
telescope.load_extension('ui-select')
telescope.load_extension('notify')
telescope.load_extension('lsp_handlers')
telescope.load_extension('undo')
telescope.load_extension('glyph')

local resolve = require('telescope.config.resolve')

TelescopeLayoutConfigVertical = {
  horizontal = { width = 0.9 },
  width = resolve.resolve_width(0.9),
  height = resolve.resolve_height(0.99),
}

TelescopeLayoutConfigHorizontal = {
  vertical = { width = 0.9 },
  width = resolve.resolve_width(0.9),
  height = resolve.resolve_height(0.99),
  -- preview_width = resolve.resolve_width(0.65),
}

telescope.setup {
  defaults = {
    --mappings = {
    --  n = { ['<space>d']  = open_with_truble, ['<c-d>']  = open_with_truble  }
    --},
    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- ..
    layout_strategy = 'horizontal',
    layout_config = TelescopeLayoutConfigHorizontal,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--fixed-strings',
    },
    path_display = { 'smart' },
  },
  pickers = {
    git_files = {
      git_command = { 'git', 'ls-files', '--m' },
    },
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    tele_tabby = { use_highlighter = true },
    lsp_handlers = {
      code_action = {
        telescope = require('telescope.themes').get_dropdown {},
      },
      rooter = {
        enable = true,
        patterns = { '.git' },
      },
    },
    symbols = { sources = { 'math' } },
    glyph = {
      action = function(glyph)
        -- argument glyph is a table.
        -- {name='', value='', category='', description=''}
        vim.fn.setreg('*', glyph.value)
        vim.api.nvim_put({ glyph.value }, 'c', false, true)
      end,
    },
  },
}

local search = require('search')

search.setup {
  append_tabs = { -- append_tabs will add the provided tabs to the default ones
    {
      name = 'Changed Files',
      tele_func = function()
        builtin.find_files {
          find_command = { 'git', 'ls-files', '--modified', '--others', '--exclude-standard' },
        }
      end,
      available = function()
        local current_dir = vim.fn.getcwd()

        local result = vim.fn.system('git -C ' .. current_dir .. ' rev-parse --is-inside-work-tree')

        return result:match('true') ~= nil
      end,
    },
  },
  tabs = {
    {
      'Grep',
      tele_func = function(opts)
        vim.notify(vim.inspect(opts))

        if opts.path ~= '' then
          builtin.live_grep { cwd = opts.path, additional_args = { '--hidden', '--glob', '!.git/*' } }
        else
          builtin.live_grep { additional_args = { '--hidden', '--glob', '!.git/*' } }
        end
      end,
      tele_opts = { path = '' },
    },
    { 'Files', builtin.find_files },
  },
}

local function telescope_server_ui()
  local current_file = vim.bo.filetype

  if current_file == 'scala' or current_file == 'sbt' then
    require('telescope').extensions.metals.commands(TelescopeLayoutConfigVertical)
  end
end

vim.keymap.set('n', '<space>c', telescope_server_ui, { silent = true })

vim.keymap.set('n', '<leader>g', function()
  search.open { tab_id = 3 }
end, { silent = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { silent = true })
vim.keymap.set('n', '<leader>qq', builtin.quickfix, { silent = true })
vim.keymap.set('n', '<space>d', builtin.diagnostics, { silent = true })
vim.keymap.set('n', '<space>a', actions_preview.code_actions, { silent = true })

vim.keymap.set('n', 'gd', builtin.lsp_definitions, { silent = true })
vim.keymap.set('n', 'gy', builtin.lsp_type_definitions, { silent = true })
vim.keymap.set('n', 'gi', builtin.lsp_implementations, { silent = true })
vim.keymap.set('n', 'gr', builtin.lsp_references, { silent = true })
vim.keymap.set('n', '<C-l>', builtin.lsp_dynamic_workspace_symbols, { silent = true })
vim.keymap.set('n', '<C-s>', function()
  builtin.symbols { sources = { 'math' } }
end, { silent = true })

vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true })
vim.keymap.set('n', 'gs', vim.lsp.buf.document_symbol, { silent = true })
vim.keymap.set('n', 'gw', vim.lsp.buf.workspace_symbol, { silent = true })

vim.keymap.set('n', '<C-g>', function()
  local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]

  require('search').open { tab_id = 1, tele_opts = { path = git_root } }
end, { silent = true })
