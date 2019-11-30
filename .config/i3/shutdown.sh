#!/bin/sh

answer=$(echo -e "Restart i3\nExit i3\nSuspend\nHibernate\nReboot\nShutdown" | rofi -dmenu -i -p "Shutdown options" -lines 6 -hide-scrollbar -font "Whatever 12" -location 0)

[ "$answer" == "Exit i3" ] && i3-msg exit
[ "$answer" == "Restart i3" ] && i3-msg restart
[ "$answer" == "Suspend" ] && $I3C/lock.sh && systemctl suspend
[ "$answer" == "Hibernate" ] && $I3C/lock.sh && systemctl hibernate
[ "$answer" == "Reboot" ] && systemctl reboot 
[ "$answer" == "Shutdown" ] && systemctl poweroff
