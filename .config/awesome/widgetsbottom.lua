-- WIDGETS BOTTOM
-- This file defines widgets to be used in the bottom bar.

-- Right side

-- CPU widget
cpuwidget = wibox.widget.textbox()
	vicious.register(cpuwidget, vicious.widgets.cpu,
	function (widget, args)
		if  args[1] == 50 then
			return "" .. colyel .. "cpu " .. coldef .. colbyel .. args[1] .. "% " .. coldef .. ""
		elseif args[1] >= 50 then
			return "" .. colred .. "cpu " .. coldef .. colbred .. args[1] .. "% " .. coldef .. ""
		else
			return "" .. colblk .. "cpu " .. coldef .. colbblk .. args[1] .. "% " .. coldef .. ""
		end
	end )
cpuwidget:buttons(awful.util.table.join(
	awful.button({}, 1, function () awful.util.spawn ( terminal .. " -e htop --sort-key PERCENT_CPU") end ) ) )

-- CPU graph
-- TODO

-- RAM widget
memwidget = wibox.widget.textbox()
	vicious.cache(vicious.widgets.mem)
	vicious.register(memwidget, vicious.widgets.mem, "" .. colblk .. "ram " .. coldef .. colbblk .. "$1% ($2 MiB) " .. coldef .. "", 59)

-- Filesystem widgets
-- root
-- fsrwidget = wibox.widget.textbox()
-- 	vicious.register(fsrwidget, vicious.widgets.fs,
-- 	function (widget, args)
-- 		if  args["{/ used_p}"] >= 93 and args["{/ used_p}"] < 97 then
-- 			infoswitch = 1
-- 			return "" .. colyel .. "/ " .. coldef .. colbyel .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
-- 		elseif args["{/ used_p}"] >= 97 and args["{/ used_p}"] < 99 then
-- 			infoswitch = 1
-- 			return "" .. colred .. "/ " .. coldef .. colbred .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
-- 		elseif args["{/ used_p}"] >= 99 and args["{/ used_p}"] <= 100 then
-- 			naughty.notify({ title = "Hard drive Warning", text = "No space left on root!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
-- 			infoswitch = 1
-- 			return "" .. colred .. "/ " .. coldef .. colbred .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. "" 
-- 		else
-- 			infoswitch = 0
-- 			return "" .. colblk .. "/ " .. coldef .. colbblk .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
-- 		end
-- 	end, 621)
-- -- /home
-- fshwidget = wibox.widget.textbox()
-- 	vicious.register(fshwidget, vicious.widgets.fs,
-- 	function (widget, args)
-- 		if  args["{/home used_p}"] >= 97 and args["{/home used_p}"] < 98 then
-- 			return "" .. colyel .. "/home " .. coldef .. colbyel .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
-- 		elseif args["{/home used_p}"] >= 98 and args["{/home used_p}"] < 99 then
-- 			return "" .. colred .. "/home " .. coldef .. colbred .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
-- 		elseif args["{/home used_p}"] >= 99 and args["{/home used_p}"] <= 100 then
-- --			naughty.notify({ title = "Hard drive Warning", text = "No space left on /home!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
-- 			return "" .. colred .. "/home " .. coldef .. colbred .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. "" 
-- 		else
-- 			return "" .. colblk .. "/home " .. coldef .. colbblk .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
-- 		end
-- 	end, 622)

-- uptime
uptimewidget = wibox.widget.textbox()
	vicious.register(uptimewidget, vicious.widgets.uptime,
	function (widget, args)
		local uptime = colblk .. "uptime " .. coldef .. colbblk
		if args[1] ~= 0 then uptime = uptime .. args[1] .. "d " end
		if args[2] ~= 0 or args[1] ~= 0 then uptime = uptime .. args[2] .. "h " end
		return uptime .. args[3] .. "m " .. coldef
	end, 31)

-- Net widgets
wifiwidget = wibox.widget.textbox()
	vicious.register(wifiwidget, vicious.widgets.wifi,
	function (widget, args)
			function ip_addr()
				local ip = io.popen("ip addr show wlan0 | grep 'inet '")
				local addr = ip:read("*a")
				ip:close()
				addr = string.match(addr, "%d+.%d+.%d+.%d+")
				return addr
			end
		if args["{link}"] == 0 then
			return ""
		else
			if args["{link}"]/70*100 <= 50 then
				return "" .. colblk .. "wlan " .. coldef .. colbblk .. ip_addr() .. coldef .. colblk .. " on " .. coldef .. colbblk .. args["{ssid}"] .. coldef .. colred .. " at " .. coldef .. colbred .. string.format("[%i%%]", args["{link}"]/70*100) .. coldef .. " "
			elseif args["{link}"]/70*100 > 50 and args["{link}"]/70*100 <=75 then
				return "" .. colblk .. "wlan " .. coldef .. colbblk .. ip_addr() .. coldef .. colblk .. " on " .. coldef .. colbblk .. args["{ssid}"] .. coldef .. colyel .. " at " .. coldef .. colbyel .. string.format("[%i%%]", args["{link}"]/70*100) .. coldef .. " "
			else
				return "" .. colblk .. "wlan " .. coldef .. colbblk .. ip_addr() .. coldef .. colblk .. " on " .. coldef .. colbblk .. args["{ssid}"] .. coldef .. colblk .. " at " .. coldef .. colbblk .. string.format("[%i%%]", args["{link}"]/70*100) .. coldef .. " "
			end
		end
	end, refresh_delay, "wlan0" )

-- Volume widget
volwidget = wibox.widget.textbox()
	vicious.register(volwidget, vicious.widgets.volume,
	function (widget, args)
		if args[1] == 0 or args[2] == "♩" then
			return "" .. colblk .. "vol " .. coldef .. colbred .. "mute" .. coldef .. "" 
		else
			return "" .. colblk .. "vol " .. coldef .. colbblk .. args[1] .. "% " .. coldef .. ""
		end
	end, 2, "Master" )

-- Left side

-- MPD widget
mpdwidget = wibox.widget.textbox()
	vicious.register(mpdwidget, vicious.widgets.mpd,
		function (widget, args)
			if args["{state}"] == "Stop" then
				return ""
			elseif args["{state}"] == "Play" then
				local np = "" .. colblk .. "mpd " .. coldef .. colbblk
				if args["{Artist}"] ~= "N/A" then
					np = np .. args["{Artist}"] .. " - "
				end
				if args["{Album}"] ~= "N/A" then
					np = np .. args["{Album}"] .. " - "
				end
				return np .. args["{Title}"] .. coldef .. ""
			elseif args["{state}"] == "Pause" then
				return "" .. colblk .. "mpd " .. coldef .. colbyel .. "paused" .. coldef .. ""
			end
			return ""
		end, refresh_delay )
