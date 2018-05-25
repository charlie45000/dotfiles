#!/bin/bash

lefthard=""
leftsoft=""
righthard=""
rightsoft=""

while true; do 

color0=$(xrdb -query -all | grep "*color0:" | sed "s/\*color0:\t//")
color1=$(xrdb -query -all | grep "*color1:" | sed "s/\*color1:\t//")
color2=$(xrdb -query -all | grep "*color2:" | sed "s/\*color2:\t//")
color3=$(xrdb -query -all | grep "*color3:" | sed "s/\*color3:\t//")
color4=$(xrdb -query -all | grep "*color4:" | sed "s/\*color4:\t//")
color5=$(xrdb -query -all | grep "*color5:" | sed "s/\*color5:\t//")
color6=$(xrdb -query -all | grep "*color6:" | sed "s/\*color6:\t//")
color7=$(xrdb -query -all | grep "*color7:" | sed "s/\*color7:\t//")
color8=$(xrdb -query -all | grep "*color8:" | sed "s/\*color8:\t//")


wrkspc=$(i3-msg -t get_workspaces | jq '.[].name' | sed s/\"// | sed s/\"//)
echo -n "%{A5:i3-msg -q workspace next:}%{A4:i3-msg -q workspace prev:}"
	for i in $wrkspc ; do
		focused=$(i3-msg -t get_workspaces | jq ".[] | select(.name==\"$i\").focused")
		urgent=$(i3-msg -t get_workspaces | jq ".[] | select(.name==\"$i\").urgent")
		if $focused ; then
			echo -n "%{B$color4 F$color7} $i %{B$color0 F$color7}"
		else
			if $urgent ; then
				echo -n "%{B$color7 F$color0}"
        		        echo -n "%{A:i3-msg -q workspace number $i:} $i %{A}"
        		        echo -n "%{B$color0 F$color7}"
			else
			 	echo -n "%{B$color0 F$color4}"
				echo -n "%{A:"i3-msg -q workspace number $i":} $i %{A}"
	        	        echo -n "%{B$color0 F$color7}"
			fi
		fi
	done
echo -n "%{A}%{A}%{r}"


for i in $(mpc --format ""); do
	a=$i
	break
done
if [ $a = "[playing]" ]; then
	echo -n "%{A4:mpc volume +2 &:}"
	echo -n "%{A5:mpc volume -2 &:}"
	echo -n "%{A2:mpc prev:}"
	echo -n "%{A3:mpc next &:}"
	echo -n "%{A:mpc toggle & :}"
	echo -n "%{F$color7}$righthard%{B$color0}%{R}"
	echo -n " $(mpc current | cut -c 1-65) "
	echo -n "%{A}%{A}%{A}%{A}%{A}"
	echo -n "%{A:i3-msg \"workspace 5; exec urxvt -e ncmpcpp\":}"
	echo -n "%{A3:killall ncmpcpp:}"
	echo -n "%{A2:mpc stop:}"
	echo -n "%{F$color2}"
	echo -n "$righthard"
	echo -n "%{R} "
	echo -n "%{B$color2}"
	echo -n "%{A}%{A}%{A}"
	echo -n "%{F$color4}$righthard%{RF$color0}"
elif [ $a = "[paused]" ]; then
	echo -n "%{A:mpc toggle & :}"
	echo -n "%{F$color4}$righthard%{RF$color0}"
	echo -n " $(mpc current | cut -c 1-65) "
	echo -n "%{A}"
	echo -n "%{A:i3-msg \"workspace 5; exec urxvt -e ncmpcpp\":}"
	echo -n "%{A3:killall ncmpcpp:}"
	echo -n "%{A2:mpc stop:}"
	echo -n "%{F$color2}"
	echo -n "$righthard"
	echo -n "%{R} "
	echo -n "%{B$color2}"
	echo -n "%{A}%{A}%{A}"
	echo -n "%{F$color4}$righthard%{RF$color0}"
else
	echo -n "%{A:i3-msg \"workspace 5; exec urxvt -e ncmpcpp\":}"
	echo -n "%{A3:killall ncmpcpp:}"
	echo -n "%{F$color2}"
	echo -n "$righthard"
	echo -n "%{R} "
	echo -n "%{B$color2}"
	echo -n "%{A}%{A}"
	echo -n "%{F$color4}$righthard%{RF$color0}"
fi

echo -n "%{A4:pactl set-sink-volume  0 +2%:}"
echo -n "%{A5:pactl set-sink-volume  0 -2%:}"
echo -n "%{A:pactl set-sink-mute 0 toggle:}"
echo -n "%{A3:pavucontrol &:}"
echo -n " VOL: $(/usr/share/i3blocks/volume 5) "
echo -n "%{A}%{A}%{A}%{A}"

b=$(acpi -b | cut -d' ' -f 3 | cut -d, -f 1)
if [ $b = "Discharging" ]; then
	echo -n "%{F$color7}$righthard%{B$color0 R}"
else
	echo -n "%{F$color2}$righthard%{B$color0 R}"
fi
echo -n " BAT: $(/usr/share/i3blocks/battery | head -n 1)"
echo -n " %{F$color4}$righthard%{R}%{F$color0 B$color4}"
echo -n " $(date +%Y-%m-%d) "
echo -n "%{F$color2}${righthard}%{B$color0}%{R}"
echo -n " $(date +%H:%M:%S)"
echo " %{B$color0 F$color7}"
wait
done
