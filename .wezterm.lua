-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

--local mux = wezterm.mux
--wezterm.on("gui-startup", function(cmd)
  --local tab, pane, window = mux.spawn_window(cmd or {})
  --window:gui_window():maximize()
--end)

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
  --stretch = 'ExtraCondensed',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_domain = 'WSL:Ubuntu-20.04'
  config.font_size = 10.5
elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  config.font_size = 10.5
else
  config.font_size = 14.0
end

-- Behavioral config
config.enable_tab_bar = false

-- Allow sending CMD-t/{/} through to tmux
local sendNextTab = act.SendKey { key = '}', mods = 'META'}
local sendPrevTab = act.SendKey { key = '{', mods = 'META'}

config.keys = {
  { key = 't', mods = 'CMD', action = act.SendKey { key = 't', mods = 'META' }, },
  { key = ']', mods = 'SUPER', action = sendNextTab },
  { key = ']', mods = 'SUPER|SHIFT', action = sendNextTab },
  { key = '}', mods = 'SUPER', action = sendNextTab },  -- Bug in WezTerm
  { key = '}', mods = 'SUPER|SHIFT', action = sendNextTab },  -- Bug in WezTerm
  { key = '[', mods = 'SUPER', action = sendPrevTab },
  { key = '[', mods = 'SUPER|SHIFT', action = sendPrevTab },
  { key = '{', mods = 'SUPER', action = sendPrevTab },  -- Bug in WezTerm
  { key = '{', mods = 'SUPER|SHIFT', action = sendPrevTab },  -- Bug in WezTerm
}

config.window_close_confirmation = 'NeverPrompt'

-- Debian Sid issues, heh
config.enable_wayland = true
--config.window_decorations = "RESIZE"
--config.window_decorations = "TITLE | RESIZE"
--config.dpi = 144

-- and finally, return the configuration to wezterm
return config
