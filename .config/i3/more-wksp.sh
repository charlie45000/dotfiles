#!/bin/sh

#[ "$1" = "go" ] && (prompt=$1) || ([ "$1" = "move" ] && (prompt="")) 

wksps=$(i3-msg -t 'get_workspaces' | jq | awk '$1 ~ /^"name":/ {print $2}' | cut -d\" -f2)
lines=$(echo "$wksps" | wc -l)
wksp=$(echo "$wksps" | rofi -dmenu -i -p "Chose a workspace to $1 to" -font "Whatever 12" -lines "$lines" -hide-scrollbar -location 0)

[ "$wksp" ] && case "$1" in
	"go")
		i3-msg workspace "$wksp"
		;;
	"move")
		i3-msg move container to workspace "$wksp"
		;;
	"move-go")
		i3-msg move container to workspace "$wksp"
		i3-msg workspace "$wksp"
		;;
	*)
		echo "not a valid command"
		;;
esac
