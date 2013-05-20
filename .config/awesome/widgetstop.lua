-- WIDGETS TOP
-- This file defines widgets to be used in the top bar.
--

-- Date widget
calwidget = wibox.widget.textbox()
	vicious.register(calwidget, vicious.widgets.date, "" .. colblu .. " %a, %d %B" .. coldef .. "", 60)

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
			return "" .. colblu .. " weather " .. coldef .. colbblu .. string.lower(args["{sky}"]) .. ", " .. args["{tempc}"] .. "°C" .. coldef .. ""
		end
	end, 1200, "LSZH")
