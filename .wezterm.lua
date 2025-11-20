-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Changing the font size and background color.
config.font_size = 12
config.background = {
    {
      source = {
      Color = 'black'
    },
    width = "100%",
    height = "100%",
    opacity = 0.85,
}}

-- Finally, return the configuration to wezterm:
return config

