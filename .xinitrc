#!/bin/bash
#
# .xinitrc
#

# additional font paths
xset +fp /usr/share/fonts/local
xset fp rehash

# udpate Xresources
xrdb -merge ~/.Xresources

# compositing
xcompmgr -cCfFD 3 &

# caps lock NOPE
(sleep 3 && xmodmap -e "remove Lock = Caps_Lock" && xmodmap -e "keysym Caps_Lock = Shift_L") &

# numlock
numlockx &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# start mpd
mpd

# start wm
exec ck-launch-session awesome
