-- Disabled until further fix
--g.coq_settings = { xdg = true, auto_start = false }

local ls = require('luasnip')
local cmp = require('cmp')

local kind_icons = {
  Text = "",
  Method = "µ",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}



local jump_one = function() ls.jump(1) end
local change_choice = function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end

vim.keymap.set({ "i" }, "<C-K>", ls.expand, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", jump_one, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-E>", change_choice, { silent = true })

cmp.setup {
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  formatting = {
    expandable_indicator = true,
    fields = { "kind", "abbr", "menu" },
    format = function(_, vim_item)
      local max_width = 85

      vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
      vim_item.menu = ""
      vim_item.abbr = string.sub(vim_item.abbr, 1, max_width)
      return vim_item
    end,
  },
  window = {
    border = { '', '', '', '', '', '', '', '' },
    winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
    winblend = vim.o.pumblend,
    scrolloff = 0,
    col_offset = 0,
    side_padding = 1,
    scrollbar = true,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip', option = { show_autosnippets = true } }
    },
    {
      { name = 'buffer' },
    }
  )
}
