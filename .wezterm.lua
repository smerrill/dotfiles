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

-- For example, changing the color scheme:
config.color_scheme = 'Dracula+'
config.font = wezterm.font {
  family = 'Monaspace Neon',
  weight = 'Medium',
  stretch = 'Condensed',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
config.font_size = 10.5
config.default_domain = 'WSL:Ubuntu-20.04'

-- Behavioral config
config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
