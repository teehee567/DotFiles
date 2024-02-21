-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Macchiato" -- Mocha Macchiato, Frappe, Latte

config.keys = {

}

config.macos_window_background_blur = 20
config.window_background_opacity = 0.7
-- and finally, return the configuration to wezterm
return config

