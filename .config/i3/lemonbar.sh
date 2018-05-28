#!/bin/bash

color0=$(xrdb -query -all | grep "*color0" | sed "s/\*color0:\t//")
color1=$(xrdb -query -all | grep "*color1" | sed "s/\*color1:\t//")
color2=$(xrdb -query -all | grep "*color2" | sed "s/\*color2:\t//")
color3=$(xrdb -query -all | grep "*color3" | sed "s/\*color3:\t//")
color4=$(xrdb -query -all | grep "*color4" | sed "s/\*color4:\t//")
color5=$(xrdb -query -all | grep "*color5" | sed "s/\*color5:\t//")
color6=$(xrdb -query -all | grep "*color6" | sed "s/\*color6:\t//")
color7=$(xrdb -query -all | grep "*color7" | sed "s/\*color7:\t//")
color8=$(xrdb -query -all | grep "*color8" | sed "s/\*color8:\t//")

echo $color0 $color1 $color2 $color3 $color4 $color5 $color6 $color7 $color8
echo Launching script

~/.config/i3/lemonbarshow.sh | lemonbar -a 24 -B "#00$(echo $color0 | sed "s/\#//")" -F "$color0" -f "Liberation Mono for Powerline-11" -f "MaterialDesignIcons-11" -f "Takao Pゴシック-12" -g x18 -p | sh
