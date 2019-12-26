#
# ~/.xinitrc
#
[ -f ~/.profile.d/shared_export.sh ] && source ~/.profile.d/shared_export.sh

#complete env
export SEARCH_ENGINE="duckduckgo.com"
export BROWSER="firefox"
export TERMINAL="urxvt"

#avoid having terminal prompt in red
export LD_PRELOAD=

#temporary
i3
