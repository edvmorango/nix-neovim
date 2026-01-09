local cmd = vim.cmd

-- highlight link EchoDocPopup Pmenu

local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
  'CursorColumn',
  'Whitespace',
}

local hooks = require('ibl.hooks')
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
  vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
  vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
  vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
  vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
  vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
  vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
end)

-- identline (make a function to enable/disable)
local ibl = require('ibl')
ibl.setup {
  indent = {
    highlight = highlight,
    char = '╎',
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

local ibl_toggle = function()
  vim.cmd('IBLToggle')
end

vim.keymap.set('n', 't', ibl_toggle)
--Map('n', 't', '<cmd>IBLToggle<CR>')
-- git
local gitsigns = require('gitsigns')

gitsigns.setup()


vim.o.updatetime = 100

-- surround

local surround = require('nvim-surround')

surround.setup()

-- motion
--
local spider = require('spider')

spider.setup {
  skipInsignificantPunctuation = true,
}

vim.keymap.set({ 'n', 'o', 'x' }, 'w', function()
  spider.motion('w')
end, { desc = 'Spider-w' })
vim.keymap.set({ 'n', 'o', 'x' }, 'e', function()
  spider.motion('e')
end, { desc = 'Spider-e' })
vim.keymap.set({ 'n', 'o', 'x' }, 'b', function()
  spider.motion('b')
end, { desc = 'Spider-b' })
vim.keymap.set({ 'n', 'o', 'x' }, 'ge', function()
  spider.motion('ge')
end, { desc = 'Spider-ge' })

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

vim.keymap.set("n", "<C-Left>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { noremap = true, silent = true })

-- Moving
vim.keymap.set('n', '<M-H>', '<C-w>H')
vim.keymap.set('n', '<M-J>', '<C-w>J')
vim.keymap.set('n', '<M-K>', '<C-w>K')
vim.keymap.set('n', '<M-L>', '<C-w>L')
vim.keymap.set('n', '<M-x>', '<C-w>x')

-- apparently normal! have dependencies, so isn't a good idea call the function directly from lua
-- so I'm quoting
function CenterCursorOnNext(forward)
  if forward then
    cmd('silent! normal! n')
    cmd('silent! normal! zz')
  else
    cmd('silent! normal! N')
    cmd('silent! normal! zz')
  end
end

vim.keymap.set('n', 'n', '<cmd>lua CenterCursorOnNext(true)<CR>', { silent = true })
vim.keymap.set('n', 'N', '<cmd>lua CenterCursorOnNext(false)<CR>', { silent = true })

-- lsp
local inc_rename = require('inc_rename')

inc_rename.setup {}

vim.keymap.set('n', '<leader>r', function()
  return ':IncRename ' .. vim.fn.expand('<cword>')
end, { expr = true }) -- the space is relevant

-- tidy (remove trailing spaces)
local tidy = require('tidy')

tidy.setup {
  filetype_exclude = {},
}

--vim-subversive

local substitute = require('substitute')
substitute.setup()

local range = require('substitute.range')

vim.keymap.set('n', '<leader>s', range.operator, { noremap = true })
vim.keymap.set('x', '<leader>s', range.visual, { noremap = true })
vim.keymap.set('n', '<leader>ss', range.word, { noremap = true })

-- undo
local yankbank = require('yankbank')

yankbank.setup {
  max_entries = 12,
  sep = '',
}

vim.keymap.set('n', 'z', function()
  vim.cmd('YankBank')
end, { silent = true })

-- fidget
local fidget = require('fidget')

fidget.setup {
  notification = {
    window = {
      avoid = { 'NvimTree' },
    },
  },
}

-- ctx
local nvim_context_vt = require('nvim_context_vt')
nvim_context_vt.setup()
vim.keymap.set('n', '<C-t>', function()
  vim.cmd('NvimContextVtToggle')
end, { silent = true })

--rooter
local rooter = require('nvim-rooter')

rooter.setup {
  rooter_patterns = { '.git', '.vimdir' },
  trigger_patterns = { '*' },
  manual = true,
  fallback_to_parent = false,
}

-- status
-- local lspstatus = require('lsp-status')

--lspstatus.config { status_symbol = 'LSP' }

-- lspstatus.register_progress()

-- scrollbar
local scrollbarInit = vim.api.nvim_create_augroup('ScrollbarInit', {})

require('autoclose').setup {}

vim.api.nvim_create_autocmd({ 'WinScrolled', 'VimResized', 'QuitPre' }, {
  group = scrollbarInit,
  command = "silent! lua require('scrollbar').show()",
})

vim.api.nvim_create_autocmd({ 'WinEnter', 'FocusGained' }, {
  group = scrollbarInit,
  command = "silent! lua require('scrollbar').show()",
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave', 'BufWinLeave', 'FocusLost' }, {
  group = scrollbarInit,
  command = "silent! lua require('scrollbar').clear()",
})

-- FOrmatter
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(args)
    local bufnr = args.buf
    local formatting_method = vim.lsp.protocol.Methods.textDocument_formatting
    for _, client in ipairs(vim.lsp.get_clients { bufnr = bufnr }) do
      if client.supports_method(formatting_method, { bufnr = bufnr }) then
        vim.lsp.buf.format { bufnr = bufnr, async = false }
        break
      end
    end
  end,
})
