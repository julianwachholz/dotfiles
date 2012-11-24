-- THEMENIGHT
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/night/theme.lua")

-- random background
math.randomseed(os.time())
for i=1,1000 do tmp=math.random(0,1000) end

if beautiful.wallpaper then
	for s = 1, screen.count() do
		local num = math.random(1, 46)
		if num < 10 then num = "0" .. num .. "" end
		gears.wallpaper.maximized(beautiful.wallpaper .. num .. beautiful.wallpaper_ext, s, true)
	end
end

-- xdefaults
local x = io.open(os.getenv("HOME") .. "/.config/Xcolours/colours", "w")
x:write('#include os.getenv("HOME") .. "/.config/Xcolours/night"')
x:close()

-- Spacer widget
spacerwidget = wibox.widget.imagebox()
spacerwidget:set_image(os.getenv("HOME") .. "/.config/awesome/themes/night/spacer.png")

-- colours
require("coloursnight")

coldef  = "</span>"
colblk  = "<span color='" .. blk .. "'>"
colred  = "<span color='" .. red .. "'>"
colgre  = "<span color='" .. gre .. "'>"
colyel  = "<span color='" .. yel .. "'>"
colblu  = "<span color='" .. blu .. "'>"
colmag  = "<span color='" .. mag .. "'>"
colcya  = "<span color='" .. cya .. "'>"
colwhi  = "<span color='" .. whi .. "'>"
colbblk = "<span color='" .. brblk .. "'>"
colbred = "<span color='" .. brred .. "'>"
colbgre = "<span color='" .. brgre .. "'>"
colbyel = "<span color='" .. bryel .. "'>"
colbblu = "<span color='" .. brblu .. "'>"
colbmag = "<span color='" .. brmag .. "'>"
colbcya = "<span color='" .. brcya .. "'>"
colbwhi = "<span color='" .. brwhi .. "'>"
