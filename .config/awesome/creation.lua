-- CREATION

-- WIBOXES
mywibox = {}
infobox = {}
mypromptbox = {}

-- taglist
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
	awful.button({ },			1, awful.tag.viewonly),
	awful.button({ modkey },	1, awful.client.movetotag),
	awful.button({ },			3, awful.tag.viewtoggle),
	awful.button({ modkey },	3, awful.client.toggletag),
	awful.button({ },			4, awful.tag.viewnext),
	awful.button({ },			5, awful.tag.viewprev)
	)
shifty.taglist = mytaglist
shifty.config.taglist = mytaglist

-- tasklist
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
	awful.button({ }, 1, function (c)
		if not c:isvisible() then
			awful.tag.viewonly(c:tags()[1])
		end
		client.focus = c
		c:raise()
	end),
	awful.button({ }, 3, function ()
		if instance then
			instance:hide()
			instance = nil
		else
			instance = awful.menu.clients({ width=250 })
		end
	end),
	awful.button({ }, 4, function ()
		awful.client.focus.byidx(1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.button({ }, 5, function ()
		awful.client.focus.byidx(-1)
		if client.focus then
			client.focus:raise()
		end
	end)
)

for s = 1, screen.count() do
	mypromptbox[s] = awful.widget.prompt()
	mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
	mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

	-- top box
	mywibox[s] = awful.wibox({ position = "top", screen = s })
		local left_layout = wibox.layout.fixed.horizontal()
			left_layout:add(mytaglist[s])
			left_layout:add(mypromptbox[s])

		local right_layout = wibox.layout.fixed.horizontal()
			if s == 1 then right_layout:add(wibox.widget.systray()) end
			right_layout:add(weatherwidget)
			right_layout:add(calwidget)
			right_layout:add(clockwidget)

	local layout = wibox.layout.align.horizontal()
		layout:set_left(left_layout)
		layout:set_middle(mytasklist[s])
		layout:set_right(right_layout)

	mywibox[s]:set_widget(layout)

	-- bottom box
	infobox[s] = awful.wibox({ position = "bottom", screen = s })
		local left_layout = wibox.layout.fixed.horizontal()
			left_layout:add(mpdwidget)

		local right_layout = wibox.layout.fixed.horizontal()
			right_layout:add(uptimewidget)
--			right_layout:add(wifidownwidget)
--			right_layout:add(wifiupwidget)
			right_layout:add(wifiwidget)
			right_layout:add(cpuwidget)
--			right_layout:add(tempwidget)
			right_layout:add(memwidget)
			right_layout:add(fsrwidget)
			right_layout:add(fshwidget)
			right_layout:add(volwidget)

	local layout = wibox.layout.align.horizontal()
		layout:set_left(left_layout)
		layout:set_right(right_layout)
	infobox[s]:set_widget(layout)

end
