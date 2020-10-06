#
# ~/.xinitrc
#

. "$HOME/.profile"

#startup setup
numlockx on
xrdb $HOME/.Xresources
xset -b -dpms  +fp $HOME/.fonts/,$HOME/.fonts/misc/,$HOME/.fonts/ohsnap/,$HOME/.fonts/tewi,$HOME/.fonts/terminesspowerline/
picom &

#complete env
export SEARCH_ENGINE="duckduckgo.com"
export BROWSER="firefox"
export TERMINAL="urxvt"

#avoid having terminal prompt in red
export LD_PRELOAD=

#temporary
i3
