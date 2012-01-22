#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

xrdb -merge ~/.Xresources
rxvt &

exec ck-launch-session dbus-launch --exit-with-session startxfce4
