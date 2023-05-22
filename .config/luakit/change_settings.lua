local s = require("settings")

-- Tell websites I prefer dark mode
s.application.prefer_dark_mode = true

-- Fonts
local font = "Roboto"
s.webview.cursive_font_family = font
s.webview.default_font_family = font
s.webview.fantasy_font_family = font
s.webview.monospace_font_family = "RobotoMono Nerd Font"
s.webview.pictograph_font_family = font
s.webview.sans_serif_font_family = font
s.webview.serif_font_family = font
s.webview.default_font_size = 16
s.webview.default_monospace_font_size = 16

-- Use most common user agent
s.webview.user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36"

-- Other webview settings
s.webview.enable_java = false
s.webview.enable_offline_web_application_cache = false
s.webview.media_playback_requires_gesture = true

-- Home / tabs
local startpage = "https://lavenderperry.github.io/startpage"
s.window.close_with_last_tab = true
s.window.home_page = startpage
s.window.new_tab_page = startpage
s.window.reuse_new_tab_pages = true

-- Search engines
s.window.search_engines = {
  whoogle = "https://farside.link/whoogle/search?q=%s",
  wiby = "https://wiby.me/?q=%s",
  awiki = "https://wiki.archlinux.org/index.php/?search=%s",
  aur = "https://aur.archlinux.org/packages?K=%s"
}
s.window.default_search_engine = "whoogle"
