-- TAGS + TAG MATCHING
-- layouts
layouts = {
--	awful.layout.suit.fair,
--	awful.layout.suit.fair.horizontal,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.max,
	awful.layout.suit.floating,
}

-- shifty: defaults
shifty.config.guess_name = true
shifty.config.layouts = layouts
shifty.config.defaults = {
	layout = awful.layout.suit.max,
	mwfact = 0.60
}

-- shifty: predefined tags
shifty.config.tags   = {
	["1-sys"] = {
		init = true,
		position = 1,
		screen = 1,
		layout = awful.layout.suit.tile
	},
	["2-web"] = {
		position = 2,
		spawn = "google-chrome",
		exclusive = true
	},
	["3-code"] = {
		position = 3,
		layout = awful.layout.suit.tile
		-- spawn = terminal .. " -e vim"
	},
	["4-com"] = {
		position = 4,
		layout = awful.layout.suit.max,
		spawn = terminal .. " -e irssi", "thunderbird"
	},
	["media"]  = {
		layout = awful.layout.suit.max,
		leave_kills = true
		-- spawn = terminal .. " -e ncmpcpp"
	},
}

-- shifty: tags matching and client rules
shifty.config.apps = {
	-- web
	{ match = { "Google Chrome", "Firefox", "google-chrome" }, tag = "2-web",                                              },
	-- code
	{ match = { "Vim"                                 }, tag = "3-code",                                             },
	-- communications
	{ match = { "irssi", "thunderbird"                }, tag = "4-com",                                              },
	-- video
	{ match = { "vlc"                                 }, tag = "media"                                               },
	{ match = { "feh", "qiv"                          }, tag = "media"                                               },

	-- client manipulation
	{ match = { "" },
		honorsizehints = false,
		buttons = awful.util.table.join (
			awful.button({        }, 1, function (c) client.focus = c; c:raise() end),
			awful.button({ modkey }, 1, awful.mouse.client.move),
			awful.button({ modkey }, 3, awful.mouse.client.resize)
		)
--	},
--	{ match = { "urxvt" },
--		intrusive = true
	}
}

shifty.init()
