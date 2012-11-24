-- RC
-- General helpers
gears = require("gears")
awful = require("awful")
awful.autofocus = require("awful.autofocus")
beautiful = require("beautiful")
vicious = require("vicious")
wibox = require("wibox")
naughty = require("naughty")
shifty = require("shifty")

-- Defaults
terminal   = "urxvt"
editor     = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
browser    = "google-chrome"
modkey     = "Mod4"
altkey     = "Mod1"

-- Configs
require("theme")

-- Errors
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "There were errors during startup!",
		text = awesome.startup_errors
	})
end

-- Runtime errors after startup
do local in_error = false
	awesome.connect_signal("debug::error",
	function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true
		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "An error occurred!",
			text = err
		})
		in_error = false
    	end)
end

require("tags")
require("menu")
require("widgetstop")
require("widgetsbottom")
require("creation")
require("bindings")
require("signals")
