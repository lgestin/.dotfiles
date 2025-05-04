local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "ayu"
config.font = wezterm.font("MesloLGS NF")
config.font_size = 18
config.line_height = 1.0
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
return config
