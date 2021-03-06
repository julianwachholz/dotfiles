default_target: help

.PHONY: help all fish fish-deps git x11 x11-deps gtk gtk-deps wm wm-deps clean

help:
	@echo "all	Sets up everything"
	@echo "fish	Setup fish"
	@echo "git	Setup git"
	@echo "x11	Configures X11"
	@echo "gtk	Configures GTK"
	@echo "wm	Configures pekwm"
	@echo "deps	Install required packages"

all:
	@make fish
	@make git
	@make x11
	@make urxvt
	@make gtk
	@make wm
	@make deps

deps-update:
	@sudo pacman -Syy --noconfirm
	@echo `date +%Y-%m-%d` > deps-update

fish-deps: deps-update
	@sudo pacman -S --noconfirm --needed fish python-virtualenv

fish: fish-deps
	@git submodule init
	@git submodule update
	@mkdir -p ${HOME}/.config/fish
	@ln -sf ${PWD}/.config/fish/config.fish ${HOME}/.config/fish/config.fish
	@ln -sf ${PWD}/.config/fish/virtual_hooks.fish ${HOME}/.config/fish/virtual_hooks.fish
	@ln -sf ${PWD}/.config/fish/functions ${HOME}/.config/fish/functions
	@ln -sf ${PWD}/.config/fish/virtualfish ${HOME}/.config/fish/virtualfish
	@echo "Configured fish."

git:
	@ln -sf ${PWD}/.gitconfig ${HOME}/.gitconfig
	@ln -sf ${PWD}/.gitignore_global ${HOME}/.gitignore_global
	@echo "Configured git."

x11-deps: deps-update
	@sudo pacman -S --noconfirm --needed xorg-xinit xorg-xmodmap xorg-xprop xorg-xrdb xorg-xset
	@sudo pacman -S --noconfirm --needed xcompmgr

x11: x11-deps
	@mkdir -p ${HOME}/.config
	@ln -sf ${PWD}/.Xresources ${HOME}/.Xresources
	@ln -sf ${PWD}/.Xmodmap ${HOME}/.Xmodmap
	@ln -sf ${PWD}/.xsession ${HOME}/.xsession
	@ln -sf ${PWD}/.xinitrc ${HOME}/.xinitrc
	@mkdir -p ${HOME}/.config
	@ln -sf ${PWD}/.config/Xcolours ${HOME}/.config/Xcolours
	@mkdir -p ${HOME}/.config/fontconfig
	@ln -sf ${PWD}/.config/fontconfig/fonts.conf ${HOME}/.config/fontconfig/fonts.conf
	@echo "Configured X11"

gtk-deps: deps-update
	@sudo pacman -S --noconfirm --needed gtk-engine-murrine
	@echo "Please install gtk-engine-equinox from AUR"

gtk: gtk-deps
	@ln -sf ${PWD}/.gtkrc-2.0 ${HOME}/.gtkrc-2.0
	@mkdir -p ${HOME}/.themes
	@ln -sf ${PWD}/.themes/tri\ 1 ${HOME}/.themes/tri\ 1
	@mkdir -p ${HOME}/.icons
	@ln -sf ${PWD}/.icons/a0x_cur1_light ${HOME}/.icons/a0x_cur1_light
	@echo "Configured GTK"

wm-deps:
	@sudo pacman -S --noconfirm --needed pekwm tint2 feh

wm: wm-deps
	@ln -sf ${PWD}/.backgrounds ${HOME}/.backgrounds
	@ln -sf ${PWD}/.pekwm ${HOME}/.pekwm
	@mkdir -p ${HOME}/.config
	@ln -sf ${PWD}/.config/tint2 ${HOME}/.config/tint2
	@echo "Configured pekwm & tint2"

deps: deps-update
	@echo "Installing other dependencies."
	@sudo pacman -S --noconfirm --needed rxvt-unicode wget firefox

	@echo "Downloading and building AUR dependencies"
	@cd /tmp
	@wget https://aur.archlinux.org/packages/ur/urxvt-perls-git/urxvt-perls-git.tar.gz
	@tar xzf urxvt-perls-git.tar.gz
	@cd urxvt-perls-git
	@makepkg --syncdeps
	@sudo pacman -U --noconfirm urxvt-perls-git-*.pkg.tar.xz
	@cd /tmp
	@rm -rf /tmp/urxvt-perls-git*
	@wget https://aur.archlinux.org/packages/gt/gtk-engine-equinox/gtk-engine-equinox.tar.gz
	@tar xzf gtk-engine-equinox.tar.gz
	@cd gtk-engine-equinox
	@makepkg --syncdeps
	@sudo pacman -U gtk-engine-equinox-*.pkg.tar.xz
	@cd /tmp
	@rm -rf /tmp/gtk-engine-equinox*

clean:
	@rm deps-update
