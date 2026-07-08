
local wezterm = require('wezterm')
local config = {}

config.window_background_opacity = 0.4
config.font_size = 17
config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font('Hack')

config.default_prog = { '/bin/fish', '-i' }

config.default_cursor_style = 'BlinkingUnderline'
config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "RESIZE"

config.colors = {
  background = "1e252e",
  foreground = "ffffff"
}

config.window_padding = {
  left = 4,
  right = 0,
  top = 0,
  bottom = 0,
}

config.line_height = 1
config.initial_rows = 25
config.initial_cols = 92
config.warn_about_missing_glyphs = false

config.tab_bar_at_bottom = true

return config

