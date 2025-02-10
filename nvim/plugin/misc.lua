local cmd = vim.cmd

-- highlight link EchoDocPopup Pmenu

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
  "CursorColumn",
  "Whitespace"
}


local hooks = require('ibl.hooks')
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

-- identline (make a function to enable/disable)
local ibl = require('ibl')
ibl.setup {
  indent = {
    highlight = highlight,
    char = '╎'
  },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
  scope = { enabled = false },
  -- for example, context is off by default, use this to turn it on
  --show_current_context = true,
  --show_current_context_start = true,
  --show_end_of_line = true,
  --space_char_blankline = " ",

}

local ibl_toggle = function() vim.cmd('IBLToggle') end

vim.keymap.set('n', 't', ibl_toggle)
--Map('n', 't', '<cmd>IBLToggle<CR>')


-- gitgutter
vim.o.updatetime = 100

-- motion
--
local spider = require("spider")

spider.setup {
  skipInsignificantPunctuation = true
}

vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })


--mouse

local nop = function() end


vim.keymap.set('i', '<ScrollWheelUp>', nop)
vim.keymap.set('i', '<S-ScrollWheelUp>', nop)
vim.keymap.set('i', '<C-ScrollWheelUp>', nop)
vim.keymap.set('i', '<ScrollWheelDown>', nop)
vim.keymap.set('i', '<S-ScrollWheelDown>', nop)
vim.keymap.set('i', '<C-ScrollWheelDown>', nop)
vim.keymap.set('i', '<ScrollWheelLeft>', nop)
vim.keymap.set('i', '<S-ScrollWheelLeft>', nop)
vim.keymap.set('i', '<C-ScrollWheelLeft>', nop)
vim.keymap.set('i', '<ScrollWheelRight>', nop)
vim.keymap.set('i', '<S-ScrollWheelRight>', nop)
vim.keymap.set('i', '<C-ScrollWheelRight>', nop)

-- ex-mode
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', 'gQ', '<nop>')



-- window
vim.keymap.set('n', '<M-h>', '<C-w>h')
vim.keymap.set('n', '<M-j>', '<C-w>j')
vim.keymap.set('n', '<M-k>', '<C-w>k')
vim.keymap.set('n', '<M-l>', '<C-w>l')

-- Moving
vim.keymap.set('n', '<M-H>', '<C-w>H')
vim.keymap.set('n', '<M-J>', '<C-w>J')
vim.keymap.set('n', '<M-K>', '<C-w>K')
vim.keymap.set('n', '<M-L>', '<C-w>L')
vim.keymap.set('n', '<M-x>', '<C-w>x')


vim.keymap.set('n', '<C-k>', '<cmd>FloatermToggle<CR>')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><cmd>FloatermToggle<CR>')



-- apparently normal! have dependencies, so isn't a good idea call the function directly from lua
-- so I'm quoting
function CenterCursorOnNext(forward)
  if forward
  then
    cmd 'silent! normal! n'
    cmd 'silent! normal! zz'
  else
    cmd 'silent! normal! N'
    cmd 'silent! normal! zz'
  end
end

vim.keymap.set('n', 'n', '<cmd>lua CenterCursorOnNext(true)<CR>', { silent = true })
vim.keymap.set('n', 'N', '<cmd>lua CenterCursorOnNext(false)<CR>', { silent = true })


-- lsp
local inc_rename = require('inc_rename')
inc_rename.setup({})

vim.keymap.set("n", "<leader>r", function() vim.cmd('IncRename') end) -- the space is relevant



-- tidy (remove trailing spaces)
local tidy = require("tidy")

tidy.setup {
  filetype_exclude = {},
}

--vim-subversive

local substitute = require('substitute')
substitute.setup()

local range = require('substitute.range')

vim.keymap.set("n", "<leader>s", range.operator, { noremap = true })
vim.keymap.set("x", "<leader>s", range.visual, { noremap = true })
vim.keymap.set("n", "<leader>ss", range.word, { noremap = true })

-- undo
local yankbank = require('yankbank')

yankbank.setup({
  max_entries = 12,
  sep = "",
})

vim.keymap.set('n', 'z', function() vim.cmd('YankBank') end, { silent = true })

-- fidget
local fidget = require("fidget")

fidget.setup {

  integration = {
    ["nvim-tree"] = {
      enable = false,
    }

  }

}

-- ctx
local nvim_context_vt = require('nvim_context_vt')
nvim_context_vt.setup()
vim.keymap.set('n', '<C-t>', function() vim.cmd('NvimContextVtToggle') end, { silent = true })

--rooter
local rooter = require('nvim-rooter')

rooter.setup {
  rooter_patterns = { '.git', '.vimdir' },
  trigger_patterns = { '*' },
  manual = true,
  fallback_to_parent = false,
}

local conform = require("conform")

conform.setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    scala = { "scalafmt" },
    rust = { "rustfmt" },
    json = { "jq" },
    nix = { "alejandra" },
    lua = { "stylua" },
    haskell = {

      command = "fourmolu",
      append_args = { "--mode inplace (git ls-files '*.hs')" }


    }
  },
})


-- status
local lspstatus = require('lsp-status')

lspstatus.config { status_symbol = 'LSP' }

-- lspstatus.register_progress()

-- scrollbar
local scrollbarInit = vim.api.nvim_create_augroup("ScrollbarInit", {})

require("autoclose").setup {}


vim.api.nvim_create_autocmd({ 'WinScrolled', 'VimResized', 'QuitPre' },
  {
    group = scrollbarInit,
    command = "silent! lua require('scrollbar').show()"
  }
)

vim.api.nvim_create_autocmd({ 'WinEnter', 'FocusGained' },
  {
    group = scrollbarInit,
    command = "silent! lua require('scrollbar').show()"
  }
)

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave', 'BufWinLeave', 'FocusLost' },
  {
    group = scrollbarInit,
    command = "silent! lua require('scrollbar').clear()"
  }
)


-- illuminate tokens
local illuminate = require('illuminate')
--
illuminate.configure({
  -- providers: provider used to get references in the buffer, ordered by priority
  providers = {
    'lsp',
    'treesitter',
    'regex',
  },
  -- delay: delay in milliseconds
  delay = 100,
  -- filetype_overrides: filetype specific overrides.
  -- The keys are strings to represent the filetype while the values are tables that
  -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
  filetype_overrides = {},
  -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
  filetypes_denylist = {
    'dirbuf',
    'dirvish',
    'fugitive',
  },
  -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
  -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
  filetypes_allowlist = {},
  -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
  -- See `:help mode()` for possible values
  modes_denylist = {},
  -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
  -- See `:help mode()` for possible values
  modes_allowlist = {},
  -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
  -- Only applies to the 'regex' provider
  -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  providers_regex_syntax_denylist = {},
  -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
  -- Only applies to the 'regex' provider
  -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  providers_regex_syntax_allowlist = {},
  -- under_cursor: whether or not to illuminate under the cursor
  under_cursor = true,
  -- large_file_cutoff: number of lines at which to use large_file_config
  -- The `under_cursor` option is disabled when this cutoff is hit
  large_file_cutoff = nil,
  -- large_file_config: config to use for large files (based on large_file_cutoff).
  -- Supports the same keys passed to .configure
  -- If nil, vim-illuminate will be disabled for large files.
  large_file_overrides = nil,
  -- min_count_to_highlight: minimum number of matches required to perform highlighting
  min_count_to_highlight = 1,
  -- should_enable: a callback that overrides all other settings to
  -- enable/disable illumination. This will be called a lot so don't do
  -- anything expensive in it.
  should_enable = function(_bufnr) return true end,
  -- case_insensitive_regex: sets regex case sensitivity
  case_insensitive_regex = false,
})
