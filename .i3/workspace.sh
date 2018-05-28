#!/bin/bash
while true; do
	color4=$(xrdb -query -all | grep "*color4:" | sed "s/\*color4:\t//")
	color11=$(xrdb -query -all | grep "*color11:" | sed "s/\*color11:\t//")

	wrkspc=$(i3-msg -t get_workspaces | jq '.[].name' | sed s/\"// | sed s/\"//)
	for i in $wrkspc ; do
	        focused=$(i3-msg -t get_workspaces | jq ".[] | select(.name==\"$i\").focused")
	        urgent=$(i3-msg -t get_workspaces | jq ".[] | select(.name==\"$i\").urgent")
	        if $focused ; then
	                output=$output"%{F$color4} $i %{F-}"
	        elif $urgent ; then
	                output=$output"%{F$color11}%{A:i3-msg -q workspace number $i:} $i %{A}%{F-}"
	        else
	                output=$output"%{A:i3-msg -q workspace number $i:} $i %{A}"
	        fi
	done
	echo -n "$output" > $HOME/.i3/workspace
	output=""
done

