#!/bin/bash
#
# ~/.xinitrc
#


# Additional font paths
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/75dpi
xset +fp /usr/share/fonts/100dpi
xset +fp /usr/share/fonts/TTF
xset fp rehash


# Xresources and Xmodmap
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap

# Compositing
xcompmgr -cCfFD 3 &


# Start stuff like pulseaudio
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec pekwm
