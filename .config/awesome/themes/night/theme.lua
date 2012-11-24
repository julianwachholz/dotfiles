-- THEME NIGHT

require("coloursnight")

theme = {}

theme.font          = "terminus 8"

theme.bg_normal     = trblk
theme.bg_focus      = brblu
theme.bg_urgent     = red
theme.bg_minimize   = trblk

theme.fg_normal     = whi
theme.fg_focus      = trblk
theme.fg_urgent     = trwhi
theme.fg_minimize   = blk

theme.border_width  = "1"
theme.border_normal = blk
theme.border_focus  = brblu
theme.border_marked = yel

-- TAGLIST
theme.tasklist_bg_focus = trblk
theme.tasklist_fg_focus = brblu
theme.tasklist_fg_normal = brwhi
theme.tasklist_fg_minimize = blk
theme.taglist_squares_sel   = nil --os.getenv("HOME") .. "/.config/awesome/themes/night/taglist/squarefw.png"
theme.taglist_squares_unsel = nil --os.getenv("HOME") .. "/.config/awesome/themes/night/taglist/squarew.png"

-- TASKLIST
theme.tasklist_floating_icon = os.getenv("HOME") .. "/.config/awesome/themes/night/tasklist/floatingw.png"

-- MENU
theme.menu_submenu_icon = os.getenv("HOME") .. "/.config/awesome/themes/night/submenu.png"
theme.menu_border_color = blk
theme.menu_height = "14"
theme.menu_width  = "90"

-- WALLPAPER
theme.wallpaper = os.getenv("HOME") .. "/.background/limbo/limbo_wallpaper_0"
theme.wallpaper_ext = ".jpg"

theme.icon_theme = nil

return theme
