#!/bin/sh

color0=$(xrdb -query -all | grep "*color0:" | sed "s/\*color0:\t//")
color1=$(xrdb -query -all | grep "*color1:" | sed "s/\*color1:\t//")
color2=$(xrdb -query -all | grep "*color2:" | sed "s/\*color2:\t//")
color3=$(xrdb -query -all | grep "*color3:" | sed "s/\*color3:\t//")
color4=$(xrdb -query -all | grep "*color4:" | sed "s/\*color4:\t//")
color5=$(xrdb -query -all | grep "*color5:" | sed "s/\*color5:\t//")
color6=$(xrdb -query -all | grep "*color6:" | sed "s/\*color6:\t//")
color7=$(xrdb -query -all | grep "*color7:" | sed "s/\*color7:\t//")
color8=$(xrdb -query -all | grep "*color8:" | sed "s/\*color8:\t//")
color9=$(xrdb -query -all | grep "*color9:" | sed "s/\*color9:\t//")
color10=$(xrdb -query -all | grep "*color10:" | sed "s/\*color10:\t//")
color11=$(xrdb -query -all | grep "*color11:" | sed "s/\*color11:\t//")
color12=$(xrdb -query -all | grep "*color12:" | sed "s/\*color12:\t//")
color13=$(xrdb -query -all | grep "*color13:" | sed "s/\*color13:\t//")
color14=$(xrdb -query -all | grep "*color14:" | sed "s/\*color14:\t//")
color15=$(xrdb -query -all | grep "*color15:" | sed "s/\*color15:\t//")

answer=$(echo -e "Restart i3\nExit i3\nHibernate\nReboot\nShutdown" | rofi -dmenu -i -p "Shutdown options" -lines 5 -hide-scrollbar -font "Whatever 12" -location 0)

[ "$answer" == "Exit i3" ] && i3-msg exit
[ "$answer" == "Restart i3" ] && i3-msg restart
[ "$answer" == "Hibernate" ] && i3-msg workspace lock && ~/.config/i3/lock.sh && systemctl hibernate
[ "$answer" == "Reboot" ] && systemctl reboot 
[ "$answer" == "Shutdown" ] && systemctl shutdown
