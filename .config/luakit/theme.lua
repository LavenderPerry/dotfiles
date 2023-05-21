local bg = "#2c1c30"
local fg = "#e9dfec"
local bg1 = "#583960"
local fg1 = "#be9fc6"
local red = "#a15e6c"
local yellow = "#a1725e"
local green = "#5e8da1"
local cyan = "#5e6ca1"

return {
  -- General
  font = "16px Roboto",
  bg = bg,
  fg = fg,
  success_fg = green,
  loaded_fg = cyan,
  error_fg = red,
  error_bg = bg,
  warning_fg = yellow,
  warning_bg = bg,
  ok = { bg = bg, fg = fg },
  warn = { bg = bg, fg = yellow },
  error = { bg = bg, fg = red },

  -- Notifications
  notif_fg = fg,
  notif_bg = bg1,

  -- Menus
  menu_fg = fg,
  menu_bg = bg,
  menu_selected_fg = fg,
  menu_selected_bg = bg,
  menu_title_bg = bg,
  menu_primary_title_fg = "#935ea1",
  menu_secondary_title_fg = fg,
  menu_disabled_fg = fg1,
  menu_disabled_bg = bg,
  menu_enabled_fg = fg,
  menu_enabled_bg = bg,
  menu_active_fg = green,
  menu_active_bg = bg,

  -- Status bar
  sbar_fg = fg,
  sbar_bg = bg,

  -- Download bar
  dbar_fg = fg,
  dbar_bg = bg,
  dbar_error_fg = red,

  -- Input bar
  ibar_fg = fg,
  ibar_bg = bg1,

  -- Tabs
  tab_fg = fg,
  tab_bg = bg,
  tab_hover_bg = "#3b2640",
  tab_ntheme = fg1,
  selected_fg = fg,
  selected_bg = bg1,
  selected_ntheme = fg1,
  loading_fg = bg,
  loading_bg = cyan,
  private_tab_bg = bg,
  selected_private_tab_bg = bg1,

  -- Trusted / untrusted SSL
  trust_fg = green,
  notrust_fg = red

  -- I don't use follow mode currently, so follow mode hints are not themed
}
