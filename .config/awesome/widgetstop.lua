-- WIDGETS TOP

-- Calendar widget
calwidget = wibox.widget.textbox()
	vicious.register(calwidget, vicious.widgets.date, "" .. colblu .. " %a, %d %B" .. coldef .. "")
--	calendar2.addCalendarToWidget(calwidget, "" .. colyel .. "%s" .. coldef .. "")

-- Clock widget
clockwidget = wibox.widget.textbox()
	vicious.register(clockwidget, vicious.widgets.date, "" .. colbblk .. " at " .. coldef .. colbblu .. "%H:%M" .. coldef .. " ")

-- Weather widget
weatherwidget = wibox.widget.textbox()
	vicious.register(weatherwidget, vicious.widgets.weather,
	function (widget, args)
		if args["{tempc}"] == "N/A" then
			return ""
		else
			weatherwidget:add_signal('mouse::enter', function () weather_n = { naughty.notify({ title = "" .. colblu .. "───────────── Weather ─────────────" .. coldef .. "", text = "" .. colbblu .. "Wind    : " .. args["{windkmh}"] .. " km/h " .. args["{wind}"] .. "\nHumidity: " .. args["{humid}"] .. " %\nPressure: " .. args["{press}"] .. " hPa" .. coldef .. "", border_color = "#1a1a1a" }) } end)
			weatherwidget:add_signal('mouse::leave', function () naughty.destroy(weather_n[1]) end)
			return "" .. colblu .. " weather " .. coldef .. colbblu .. string.lower(args["{sky}"]) .. ", " .. args["{tempc}"] .. "°C" .. coldef .. ""
		end
	end, 1200, "LSZH" )
--weatherwidget:buttons(awful.util.table.join(
--	awful.button({}, 3, function () awful.util.spawn ( browser .. " http://www.weatherzone.com.au/qld/lower-burdekin/townsville") end) ) )
