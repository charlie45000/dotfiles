#!bin/bash

lefthard=""
leftsoft=""
righthard=""
rightsoft=""

battery=$(acpi -b)
state=$(echo $battery | cut -d' ' -f 3 | cut -d, -f 1)
percentage=$(echo $battery | cut -d' ' -f 4 | cut -d, -f1)
percent=$(echo $percentage | cut -d% -f 1)
timeleft=$(echo $battery | cut -d' ' -f 5)
timeleftn=$(echo $timeleft | cut -d: -f 1):$(echo $timeleft | cut -d: -f 2)
if [ $state = "Discharging" ]; then
	if [ $percent -ge 75 ]
	then
		echo -n "%{F$2}$righthard%{B$1 RF$7} BAT: $percentage ($timeleftn) %{F$3}$righthard%{R}%{F$1 B$3}"
	elif [ $percent -ge 50 ]
	then
		echo -n "%{F$2}$righthard%{B$6 R} BAT: $percentage ($timeleftn) %{F$3}$righthard%{R}%{F$1 B$3}"
	elif [ $percent -ge 25 ]
	then
		echo -n "%{F$2}$righthard%{B$5 R} BAT: $percentage ($timeleftn) %{F$3}$righthard%{R}%{F$1 B$3}"
	elif [ $percent -ge 10 ]
	then
		echo -n "%{F$2}$righthard%{B$4 R} BAT: $percentage ($timeleftn) %{F$3}$righthard%{R}%{F$1 B$3}"
	else
		echo -n "%{F$4}$righthard%{B$3 R} BAT: $percentage ($timeleftn) %{F$3}$righthard%{R}%{F$1 B$3}"
	fi
else
        echo -n "%{F$2}$righthard%{B$1 R} BAT: $percentage ($timeleftn) %{F$3}$righthard%{R}%{F$1 B$3}"
fi

#color0 = $1; color3 = $2; color4 = $3 color11 = $4 color12 = $5 color13 = $6 color14 = $7
