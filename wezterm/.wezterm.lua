--! NOTE:  Pull in the wezterm API
local wezterm = require 'wezterm'

--! NOTE:  This table will hold the configuration.
local config = {}

--! NOTE:  In newer versions of wezterm, use the config_builder which will
--! NOTE:  help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

--! NOTE: This is where you actually apply your config choices

-- config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.window_decorations = "RESIZE"

config.window_close_confirmation = "NeverPrompt"
config.color_scheme = "Catppuccin Macchiato" -- Mocha Macchiato, Frappe, Latte
config.font_size = 10
config.keys = {
}
config.window_background_opacity = 0.8


--! NOTE: Windows Specific
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
  config.color_scheme = "Catppuccin Frappe"
elseif wezterm.target_triple == 'aarch64-apple-darwin' then
  config.macos_window_background_blur = 20
end

return config
