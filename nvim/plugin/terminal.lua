local function term_dir()
  local ok, git_root = pcall(function()
    return vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  end)

  if not ok or git_root == nil or git_root == '' then
    return vim.fn.getcwd(0)
  end
  return vim.fn.trim(git_root)
end



local term = require("floatty").setup {
  cmd = vim.o.shell,                      -- Terminal command to run
  cwd = term_dir,                         -- Working directory of the command
  id = function() return vim.v.count end, -- Identifier for the float
  start_in_insert = true,                 -- Start in insert mode
  focus = true,                           -- Focus the window after opening
  on_open = nil,                          -- Callback(config, buf) when buffer is created
  on_exit = nil,                          -- Callback(config, buf) when buffer is destroyed
  window = {
    row = nil,                            -- Supports percentages (<=1) and absolute sizes (>1)
    col = nil,                            -- Supports percentages (<=1) and absolute sizes (>1)
    width = 0.9,                          -- Supports percentages (<=1) and absolute sizes (>1)
    height = 0.9,                         -- Supports percentages (<=1) and absolute sizes (>1)
    h_align = "center",                   -- "left", "center", "right" (used when col is nil)
    v_align = "center",                   -- "top", "center", "bottom" (used when row is nil)
    border = "rounded",                   -- Border style
    zindex = 50,                          -- Z-index of the float
    title = "",                           -- window title
    title_pos = "center",                 -- "left", "center", "right"
    -- see :h nvim_open_win() for more config options
  },
  wo = { -- Window-local options
    cursorcolumn = false,
    cursorline = false,
    cursorlineopt = "both",
    fillchars = "eob: ,lastline:…",
    list = false,
    listchars = "extends:…,tab:  ",
    number = false,
    relativenumber = false,
    signcolumn = "no",
    spell = false,
    winbar = "",
    statuscolumn = "",
    wrap = false,
    sidescrolloff = 0,
    -- other window options are also supported
  },
}

vim.keymap.set('n', '<C-a>', function() term.toggle() end)
vim.keymap.set('t', '<C-a>', function() term.toggle() end)
