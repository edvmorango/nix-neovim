-- cmd 'colorscheme neodark'

local colors = require('onenord.colors')

colors.load()

local onenord = require('onenord')

onenord.setup {
  theme = 'dark', -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  -- Style that is applied to various groups: see `highlight-args` for options
  styles = {
    comments = 'NONE',
    strings = 'NONE',
    keywords = 'NONE',
    functions = 'NONE',
    variables = 'NONE',
    diagnostics = 'undercurl',
  },
  disable = {
    background = false, -- Disable setting the background color
    cursorline = false, -- Disable the cursorline
    eob_lines = false, -- Hide the end-of-buffer lines
  },
  -- Inverse highlight for different groups
  inverse = {
    match_paren = true,
  },
  custom_highlights = {}, -- Overwrite default highlight groups
  custom_colors = {}, -- Overwrite default colors
}

local evergarden = require('evergarden')

evergarden.setup()

local vague = require('vague')

vague.setup()

local charleston = require('charleston')

charleston.setup { opts = {} }

-- cmd('colorscheme onenord')
--cmd('colorscheme evergarden')

local function set_colorscheme_by_time()
  local hour = tonumber(os.date('%H')) -- Get current hour

  if hour >= 20 or hour < 6 then
    vim.cmd('colorscheme vague') -- Light theme
  else
    vim.cmd('colorscheme charleston') -- Dark theme
  end
end

set_colorscheme_by_time()
