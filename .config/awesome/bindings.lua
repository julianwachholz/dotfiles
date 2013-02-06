-- BINDINGS

-- Mouse bindings
root.buttons(awful.util.table.join(
	awful.button({ }, 3, function () mainmenu:toggle() end),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev))
)

-- Key bindings
-- Global
globalkeys = awful.util.table.join(
	-- Awesome and X stuff
--	awful.key({ modkey, "Shift"   }, "q",                    awesome.quit             ),
--	awful.key({ modkey, "Shift"   }, "r",                    awesome.restart          ),
	awful.key({ altkey, "Control" }, "Delete",               function () awful.util.spawn("slock") end),

	-- Tags
	awful.key({ modkey,           }, "Prior",                 awful.tag.viewprev       ),
	awful.key({ modkey,           }, "Next",                  awful.tag.viewnext       ),
	awful.key({ modkey, "Shift"   }, "Prior",                 shifty.shift_prev        ),
	awful.key({ modkey, "Shift"   }, "Next",                  shifty.shift_next        ),
	awful.key({ modkey            }, "z",                     shifty.del ),
	awful.key({ modkey,           }, "Escape",                awful.tag.history.restore),
	awful.key({ modkey,           }, "Right",                 function ()
		awful.client.focus.byidx( 1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey,           }, "Left",                  function ()
		awful.client.focus.byidx(-1)
		if client.focus then
			client.focus:raise()
		end
	end),
--	awful.key({ modkey, "Control" }, "+",                     function () awful.tag.incmwfact( 0.05) end   ),
--	awful.key({ modkey, "Control" }, "-",                     function () awful.tag.incmwfact(-0.05) end   ),
	awful.key({ modkey, "Shift"   }, "r",                     shifty.rename                                ),
	awful.key({ modkey, "Shift"   }, "w",                     shifty.del                                   ),
	awful.key({ modkey, "Shift"   }, "t",                     function () shifty.add({ rel_index = 1 }) end),

	-- Programs
	awful.key({                   }, "Print",                 function () awful.util.spawn("shoot") end),
	-- launchers
	awful.key({ modkey,           }, "w",                     function () mainmenu:show({keygrabber=true, coords={x=0, y=14} }) end),
	awful.key({ modkey,           }, "r",                     function () awful.util.spawn("dmenu_run -fn 'terminus' -nb '" .. trblk .. "' -nf '" .. brblk .. "' -sb '" .. trblk .. "' -sf '" .. brblu .. "'") end),
	awful.key({ modkey, "Shift"   }, "Return",                function () awful.util.spawn(terminal) end),
	-- volume + mpd
	awful.key({                   }, "XF86AudioLowerVolume",  function () awful.util.spawn("ponymix decrease 5") end),
	awful.key({                   }, "XF86AudioRaiseVolume",  function () awful.util.spawn("ponymix increase 5") end),
	awful.key({                   }, "XF86AudioPlay",         function () awful.util.spawn("ncmpcpp toggle") end),
	awful.key({                   }, "XF86AudioNext",         function () awful.util.spawn("ncmpcpp next") end),
	awful.key({                   }, "XF86AudioPrev",         function () awful.util.spawn("ncmpcpp prev") end),
	awful.key({                   }, "XF86AudioMute",         function () awful.util.spawn("ponymix toggle") end),
	awful.key({ modkey,           }, "m",                     function () awful.util.spawn(terminal .. " -e ncmpcpp") end),
	-- file managers
	awful.key({ modkey,           }, "e",                     function () awful.util.spawn(terminal .. " -e ranger") end),

	-- Layouts
	awful.key({ modkey, "Shift"   }, "Right",                 function () awful.client.swap.byidx(  1) end),
	awful.key({ modkey, "Shift"   }, "Left",                  function () awful.client.swap.byidx( -1) end),
	awful.key({ modkey, "Control" }, "Right",                 function () awful.screen.focus_relative( 1) end),
	awful.key({ modkey, "Control" }, "Left",                  function () awful.screen.focus_relative(-1) end),
	awful.key({ modkey,           }, "u",                     awful.client.urgent.jumpto),

	-- Awesome
	awful.key({ modkey,           }, "space",                 function () awful.layout.inc(layouts,  1) end),
	awful.key({ modkey, "Shift"   }, "space",                 function () awful.layout.inc(layouts, -1) end)
)

-- Clients
clientkeys = awful.util.table.join(
	awful.key({                   }, "F11",                  function (c) c.fullscreen = not c.fullscreen  end),
	awful.key({ modkey, "Shift"   }, "c",                    function (c) c:kill() end),
	awful.key({ modkey, "Control" }, "space",                awful.client.floating.toggle ),
	awful.key({ modkey, "Control" }, "Return",               function (c) c:swap(awful.client.getmaster()) end),
	awful.key({ modkey, "Shift  " }, "o",                    awful.client.movetoscreen ),
	awful.key({ modkey,           }, "n",                    function (c) c.minimized = not c.minimized end)
)

-- WORKSPACES
-- shifty:
for i=1,9 do
	globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey }, i, function ()
		local t = awful.tag.viewonly(shifty.getpos(i))
	end))
	globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Control" }, i, function ()
		local t = shifty.getpos(i)
		t.selected = not t.selected
	end))
	globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Shift" }, i, function ()
		if client.focus then
			local t = shifty.getpos(i)
			awful.client.movetotag(t)
			awful.tag.viewonly(t)
		end
	end))
end

-- Set keys
root.keys(globalkeys)
shifty.config.globalkeys = globalkeys
shifty.config.clientkeys = clientkeys
