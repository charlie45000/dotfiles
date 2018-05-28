#!/bin/bash


c0=$(xrdb -query -all | grep "*color0:" | sed "s/\*color0:\t//")
c1=$(xrdb -query -all | grep "*color1:" | sed "s/\*color1:\t//")
c2=$(xrdb -query -all | grep "*color2:" | sed "s/\*color2:\t//")
c3=$(xrdb -query -all | grep "*color3:" | sed "s/\*color3:\t//")
c4=$(xrdb -query -all | grep "*color4:" | sed "s/\*color4:\t//")
c5=$(xrdb -query -all | grep "*color5:" | sed "s/\*color5:\t//")
c6=$(xrdb -query -all | grep "*color6:" | sed "s/\*color6:\t//")
c7=$(xrdb -query -all | grep "*color7:" | sed "s/\*color7:\t//")
c8=$(xrdb -query -all | grep "*color8:" | sed "s/\*color8:\t//")
c9=$(xrdb -query -all | grep "*color9:" | sed "s/\*color9:\t//")
c10=$(xrdb -query -all | grep "*color10:" | sed "s/\*color10:\t//")
c11=$(xrdb -query -all | grep "*color11:" | sed "s/\*color11:\t//")
c12=$(xrdb -query -all | grep "*color12:" | sed "s/\*color12:\t//")
c13=$(xrdb -query -all | grep "*color13:" | sed "s/\*color13:\t//")
c14=$(xrdb -query -all | grep "*color14:" | sed "s/\*color14:\t//")
c15=$(xrdb -query -all | grep "*color15:" | sed "s/\*color15:\t//")


rofi -show run -lines 3 -width 30 -hide-scrollbar -location 2 -opacity "85" -font "Liberation Mono for Powerline 15" -color-window "$c0,$c0,$c3" -color-normal "$c0,$c4,$c0,$c0,$c11"
