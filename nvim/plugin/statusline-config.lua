local lualine = require('lualine')

local function lsp_active()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if next(clients) ~= nil then
    return "LSP" -- you can swap this icon/text for anything you like
  end
  return ""
end


lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '|', right = '|' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', lsp_active },
    lualine_c = { 'diagnostics', { 'filename', path = 2 } },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}

}
