-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Theme
config.color_scheme = "Mocha (base16)"
config.colors = {
  background = "#181818",
  tab_bar = {
    inactive_tab_edge = "#181818",
  },
}
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
-- config.font = wezterm.font("Hack Nerd Font", { weight = "Medium" })
-- config.font = wezterm.font("Iosevka Nerd Font Mono", { weight = "Medium" })
-- config.font = wezterm.font("SFMono Nerd Font", { weight = "Medium" })
-- config.font = wezterm.font("IntoneMono Nerd Font", { weight = "Regular" })
-- config.font = wezterm.font("CaskaydiaMono Nerd Font", { weight = "Regular" })
config.font_size = 16.0

config.line_height = 1.7
config.enable_scroll_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 1

config.window_padding = {
  top = 0,
  left = 2,
  right = 2,
  bottom = 0,
}

-- Keymaps
config.leader = { key = "Space", mods = "CTRL|SHIFT" }
config.keys = {
  {
    key = "P",
    mods = "CTRL",
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key = "J",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "L",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
}

-- Tabbar
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.window_frame = {
  font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
  font_size = 15.0,
  active_titlebar_bg = "#181818",
  inactive_titlebar_bg = "#181818",
}

function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end

  return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local edge_background = "#181818"
  local background = "#181818"
  local foreground = "#808080"

  if tab.is_active then
    background = "#181818"
    foreground = "#c0c0c0"
  elseif hover then
    background = "#181818"
    foreground = "#c0c0c0"
  end

  local edge_foreground = background
  local title = tab_title(tab)

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = " " },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = " " },
  }
end)

-- Hyperlink open
config.mouse_bindings = {
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = act.CompleteSelection("PrimarySelection"),
  },

  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = act.OpenLinkAtMouseCursor,
  },

  -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
  {
    event = { Down = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = act.Nop,
  },
}

-- and finally, return the configuration to wezterm
return config
