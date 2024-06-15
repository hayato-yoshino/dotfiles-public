-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'iceberg-dark'

config.use_ime = true
config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"

config.keys = {}

-- and finally, return the configuration to wezterm
return config
