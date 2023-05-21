require("lfs")
require("unique_instance")

-- Set the cookie storage location
soup.cookies_storage = luakit.data_dir .. "/cookies.db"

local lousy = require("lousy")

lousy.theme.init(lousy.util.find_config("theme.lua"))
assert(lousy.theme.get(), "failed to load theme")

local window = require("window")
require("webview")
require("log_chrome")

window.add_signal("build", function (w)
    local widgets, l, r = require "lousy.widget", w.sbar.l, w.sbar.r

    -- Left-aligned status bar widgets
    l.layout:pack(widgets.uri())
    l.layout:pack(widgets.hist())
    l.layout:pack(widgets.progress())

    -- Right-aligned status bar widgets
    r.layout:pack(widgets.buf())
    r.layout:pack(widgets.ssl())
    r.layout:pack(widgets.scroll())
end)

require("modes")
require("binds")
require("settings")
require("settings_chrome")
require("adblock")
require("adblock_chrome")
require("webinspector")
local session = require "session"
require("undoclose")
require("tabhistory")
require("tabmenu")
require("userscripts")
local downloads = require("downloads")
require("downloads_chrome")
require("viewpdf")

-- xdg-open to open downloads
downloads.add_signal("open-file", function (file)
    luakit.spawn(string.format("xdg-open %q", file))
    return true
end)

require("cmdhist")
require("search")
require("history")
require("history_chrome")
require("help_chrome")
require("binds_chrome")
require("completion")

require("go_input")
require("go_next_prev")
require("go_up")

-- Filter Referer HTTP header if page domain does not match Referer domain
require_web_module("referer_control_wm")

require("error_page")
require("hide_scrollbars")
require("tab_favicons")
require("view_source")

require("change_settings")

window.new(uris)
