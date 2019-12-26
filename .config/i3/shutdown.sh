#!/bin/sh

answer=$(printf "Restart i3\nExit i3\nSuspend\nHibernate\nReboot\nShutdown" | rofi -dmenu -i -p "Shutdown options" -lines 6 -hide-scrollbar -font "Whatever 12" -location 0)

#the sleep are here to prevent scrot from tacking a screeshot with rofi in it

[ "$answer" = "Exit i3" ] && i3-msg exit
[ "$answer" = "Restart i3" ] && i3-msg restart
[ "$answer" = "Suspend" ] && sleep 0.15 && "$I3C"/lock.sh && systemctl suspend
[ "$answer" = "Hibernate" ] && sleep 0.15 && "$I3C"/lock.sh && systemctl hibernate
[ "$answer" = "Reboot" ] && systemctl reboot
[ "$answer" = "Shutdown" ] && systemctl poweroff
