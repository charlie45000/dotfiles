#!/bin/sh

answer=$(printf "Restart i3\nExit i3\nSuspend\nHibernate\nReboot\nShutdown" | rofi -dmenu -i -p "Shutdown options" -l 6 -hide-scrollbar -font "Whatever 12" -location 0)

#the sleep are here to prevent scrot from tacking a screeshot with rofi in it

resume(){
	sleep 0.40
	COMMAND=$1 "$I3C"/lock.sh
}


[ "$answer" = "Exit i3" ] && i3-msg exit
[ "$answer" = "Restart i3" ] && i3-msg restart
[ "$answer" = "Suspend" ] && resume 'systemctl suspend'
[ "$answer" = "Hibernate" ] && resume 'systemctl hibernate'
[ "$answer" = "Reboot" ] && systemctl reboot
[ "$answer" = "Shutdown" ] && systemctl poweroff
