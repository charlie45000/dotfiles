#!/bin/sh
icon="$I3C/lock.png"
tmpbg='/tmp/screen.png'

awk="
BEGIN {
	i = 1;
}

\$1 ~ /[0-9]+:/ {
	split(\$3, screen, \"/\");
	split(screen[3], offset, \"+\");
	split(screen[2], y, \"x\");
	x_i = offset[2]+screen[1]/2
	y_i = offset[3]+y[2]/2
	if(!dup[offset[2], offset[3]]++){
		center[i, 1] = x_i;
		center[i, 2] = y_i;
		i++;
	}
}

\$3 ~ /^[0-9]+x[0-9]+$/ {
	split(\$3, lock, \"x\");
}

END {
	convert=\"\";
	for(j=1;j<i;j++){
		x_i = center[j, 1]-lock[1]/2;
		y_i = center[j, 2]-lock[2]/2;
		convert = convert \" \" icon \" -geometry +\" x_i \"+\" y_i \" -composite -matte\";
	}
	print convert;
}
"
scrot -o "$tmpbg"
result=$( (xrandr --listactivemonitors && identify "$I3C"/lock.png) | awk -v icon="$icon" "$awk")
echo $result
eval "convert $tmpbg -scale 10% -scale 1000% $result $tmpbg"
if [ "$1" != "--dryrun" ]; then
	#pkill -SIGUSR1 dunst
	dunsctl set-paused true
	i3lock -nei "$tmpbg"
	#pkill -SIGUSR2 dunst
	dunsctl set-paused false
fi
