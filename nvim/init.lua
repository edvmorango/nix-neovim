vim.loader.enable()

local g = vim.g -- a table to access global variables

local o = vim.o

g.filetype = true
g.on = true
g.syntax_on = true

g.timeoutlen = 500

o.autochdir = true

--true colors
o.termguicolors = true

o.shortmess = 'F' -- o.shortmess:gsub('F', '') .. 'c'
o.completeopt = 'menuone,noinsert,noselect'

o.ignorecase = true
o.smartcase = true

vim.wo.number = true

o.wrap = false
o.showmode = true
o.smartindent = true
o.autoindent = true
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.incsearch = true
o.mouse = 'a'
o.history = 1000
o.whichwrap = o.whichwrap .. '<,>,h,l,[,]'
vim.wo.linebreak = true
o.relativenumber = false
o.textwidth = 120
o.tabstop = 2
o.clipboard = o.clipboard .. 'unnamedplus'        --copy paste
o.laststatus = 2
o.viewoptions = 'folds,options,cursor,unix,slash' --UNIX better support
o.encoding = 'utf-8'
o.cmdheight = 2                                   -- "for echodoc
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

o.foldenable = true
o.foldlevel = 99
o.foldmethod = 'expr'
o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
o.foldtext = ''
vim.opt.foldcolumn = '0'
vim.opt.fillchars:append { fold = ' ' }

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- eagle
o.mousemoveevent = true

Map('i', '<C-d>', '<Esc>')
Map('n', '<C-d>', '<Esc>')
Map('v', '<C-d>', '<Esc>')
Map('s', '<C-d>', '<Esc>')
Map('x', '<C-d>', '<Esc>')
Map('o', '<C-d>', '<Esc>')
Map('!', '<C-d>', '<Esc>')
Map('l', '<C-d>', '<Esc>')
Map('c', '<C-d>', '<Esc>')
Map('t', '<C-d>', '<Esc>')
Map('', '<C-d>', '<Esc>')

vim.opt.scrolloff = 10
vim.opt.inccommand = 'split'
vim.opt.undofile = true

vim.opt.jumpoptions = 'stack,view'

vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars:append('space:·, nbsp:␣')

--autosave
g.auto_save = true
g.auto_save_silent = true

-- vim-rooter
g.rooter_manual_only = true

-- echodoc
g.echodoc = { enable_at_startup = true, type = 'virtual' }

-- float term
g.floaterm_keyMap_new = '<F7>'
g.floaterm_keyMap_prev = '<C-w>'
g.floaterm_keyMap_next = '<C-e>'
g.floaterm_width = 0.9
g.floaterm_height = 0.9

-- subversive
g.subversivePromptWithActualCommand = 0

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldmethod = 'expr'
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})

vim.api.nvim_create_autocmd('LspDetach', { command = 'setl foldexpr<' })


-- lsp
--
vim.lsp.enable('css_variables')
vim.lsp.enable('postgres_lsp')
vim.lsp.enable('yamlls')
vim.lsp.enable('dockerls')
vim.lsp.enable('docker_compose_language_service')
vim.lsp.enable('rust_analyzer')
