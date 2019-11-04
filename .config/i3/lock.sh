#!/usr/bin/env bash

icon="$I3C/lock.png"
tmpbg='/tmp/screen.png'

scrot -o "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -i "$tmpbg"
