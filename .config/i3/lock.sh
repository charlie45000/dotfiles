#!/usr/bin/env bash


addlockimage(){
	convert "$tmpbg" "$icon" -geometry $1  -composite -matte "$tmpbg"
}
#exec 1>&/tmp/test.log
icon="$I3C/lock.png"
tmpbg='/tmp/screen.png'

if [[ $1 != "--addimage" ]]; then
	awk="
	BEGIN {
		i = 1;
	} 
	
	\$1 ~ /[0-9]+:/ {
		split(\$3, screen, \"/\");
		split(screen[3], offset, \"+\");
		split(screen[2], y, \"x\");
		x_i = offset[2]+screen[1]/2;
		y_i = offset[3]+y[2]/2;
		if(!dup[x_i, y_i]++){
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
			#system(\"\$I3C/lock.sh --addimage +\" x_i \"+\" y_i);
			convert = convert \"convert \" tmpbg \" \" icon \" -geometry +\" x_i \"+\" y_i \" -composite -matte \" tmpbg \";\";
		}
		print convert;
	}
	"
	scrot -o "$tmpbg"
	convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
	result=$( (xrandr --listactivemonitors && identify $I3C/lock.png) | awk -v icon="$icon" -v tmpbg="$tmpbg" "$awk")
	echo "$result"
	eval "$result"
	if [[ $1 != "--dryrun" ]]; then
		i3lock -i "$tmpbg"
	fi
else
	addlockimage $2
fi

