require("luxterm").setup({
  -- Manager window dimensions (0.1 to 1.0)
  manager_width = 0.95,  -- 80% of screen width
  manager_height = 0.95, -- 80% of screen height

  -- Enable live preview pane
  preview_enabled = true,

  -- Focus new sessions when created via :LuxtermNew
  focus_on_create = true,

  -- Auto-hide floating windows when cursor leaves
  auto_hide = true,

  -- Keybinding configuration
  keymaps = {
    toggle_manager = "<C-a>",   -- Toggle session manager
    next_session = "<C-.>",     -- Next session keybinding
    prev_session = "<C-,>",     -- Previous session keybinding
    global_session_nav = false, -- Enable global session navigation
  }
})
