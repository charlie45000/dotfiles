#!/bin/sh

link="$1"

handler=$(printf "copy\nsurf\nmpv\nfirefox" | rofi -dmenu -i -p "Choose a link handler" -font "Whatever 12" -lines 4 -hide-scrollbar -location 0)

[ "$link" ] && [ "$handler" ] && case "$handler" in 
	"copy")
       		echo "$link" | xclip -selection clipboard
		;;
	*)
		"$handler" "$link"
		;;
esac
