-- Disabled until further fix
--g.coq_settings = { xdg = true, auto_start = false }

local blink = require('blink.cmp')

blink.setup {
  enabled = function()
    return true
  end,
  fuzzy = { implementation = 'lua', prebuilt_binaries = { download = false } },
  keymap = {
    preset = 'enter',
  },
  sources = {

    default = {},

    per_filetype = {
      lua = { 'lsp', 'path', 'snippets' },
      scala = { 'lsp', 'path', 'snippets' },
      sbt = { 'lsp', 'path', 'snippets' },
      nix = { 'lsp', 'path', 'snippets' },
    },
  },

  completion = {
    keyword = {
      range = 'prefix',
    },

    trigger = {
      prefetch_on_insert = true,
      show_on_keyword = true,
      show_on_trigger_character = true,
      show_on_blocked_trigger_characters = { ' ', '\n', '\t' },
      show_on_accept_on_trigger_character = true,
      show_on_insert_on_trigger_character = true,
      show_on_x_blocked_trigger_characters = { "'", '"', '(', '{', '[' },
    },
    list = {
      max_items = 200,
      selection = {
        preselect = true,
        auto_insert = true,
      },
    },
    accept = {
      dot_repeat = true,
      create_undo_point = true,
      resolve_timeout_ms = 100,
      auto_brackets = {
        enabled = true,
        default_brackets = { '(', ')' },
        override_brackets_for_filetypes = {},
        -- Synchronously use the kind of the item to determine if brackets should be added
        kind_resolution = {
          enabled = true,
          blocked_filetypes = { 'typescriptreact', 'javascriptreact', 'vue' },
        },
        semantic_token_resolution = {
          enabled = true,
          blocked_filetypes = { 'java' },
          timeout_ms = 400,
        },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
      update_delay_ms = 50,
      treesitter_highlighting = true,
      draw = function(opts)
        opts.default_implementation()
      end,
      window = {
        min_width = 10,
        max_width = 120,
        max_height = 50,
        border = 'rounded', -- Defaults to `vim.o.winborder` on nvim 0.11+ or 'padded' when not defined/<=0.10
        winblend = 0,
        winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
        -- Note that the gutter will be disabled when border ~= 'none'
        scrollbar = true,
        -- Which directions to show the documentation window,
        -- for each of the possible menu window directions,
        -- falling back to the next direction when there's not enough space
        direction_priority = {
          menu_north = { 'e', 'w', 'n', 's' },
          menu_south = { 'e', 'w', 's', 'n' },
        },
      },
    },
  },
  appearance = {
    highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
    use_nvim_cmp_as_default = false,
    nerd_font_variant = 'mono',
    kind_icons = {
      Text = '󰉿',
      Method = '󰊕',
      Function = '󰊕',
      Constructor = '󰒓',
      Field = '󰜢',
      Variable = '󰆦',
      Property = '󰖷',
      Class = '󱡠',
      Interface = '󱡠',
      Struct = '󱡠',
      Module = '󰅩',
      Unit = '󰪚',
      Value = '󰦨',
      Enum = '󰦨',
      EnumMember = '󰦨',
      Keyword = '󰻾',
      Constant = '󰏿',
      Snippet = '󱄽',
      Color = '󰏘',
      File = '󰈔',
      Reference = '󰬲',
      Folder = '󰉋',
      Event = '󱐋',
      Operator = '󰪚',
      TypeParameter = '󰬛',
    },
  },
}
