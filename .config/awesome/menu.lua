-- MENU

awesomemenu = {
	{ "restart",     awesome.restart },
	{ "quit",        awesome.quit },
}

systemmenu = {
	{ "reboot",      "reb" },
	{ "shutdown",    "shut" }
}

mainmenu = awful.menu({
	items = {
		{ "terminal",   terminal },
		{ "lock",	"slock" },
		{ "system",	systemmenu },
		{ "awesome",	awesomemenu }
	}
})
