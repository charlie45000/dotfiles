#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#i3 config env var
export I3C="$HOME/.config/i3"

#alias for git config
alias wmc='cd $HOME/.config/i3'

#dotfiles management
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
complete -F _git config

#sudo completion and editing
complete -cf sudo
alias visudo="sudo -E visudo"

#alias nordvpnr='nordvpn d; nordvpn c'

PS1='[\u@\h \W]\$ '

#source for auto completion:
source /etc/bash_completion.d/git-flow-completion.bash
source /usr/share/git/completion/git-completion.bash
source /usr/share/bash-completion/bash_completion

#stderr color
export COLOR_RED="$(tput setaf 160)"
export COLOR_RESET="$(tput sgr0)"

#export LD_PRELOAD="/usr/local/lib/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"

colorize ()
{
#	RED=`echo -e "\e[31m"`
#	RESET=`echo -e "\e[39m"`
#
#	#perl -e '$|=1'
#	while read line; do
#		printf "$RED$line$RESET\n"
#	done >&9
	perl -e '$|=1; while(sysread STDIN,$a,9999) {print "$ENV{COLOR_RED}$a$ENV{COLOR_RESET}"}'
}


exec 9>&2
exec 8> >(colorize)
#exec 8> >(sed -u "s/^/\o033[31m/; s/\$/\o033[0m/")
function undirect(){ exec 2>&9; }
function redirect(){ exec 2>&8; }
trap "redirect" DEBUG
PROMPT_COMMAND='undirect'

su_cmd ()
{
	trap - DEBUG
	echo test
	su $@
	trap "redirect;" DEBUG
}


#source ~/.config/bash/colorize.sh
#PROMPT_COMMAND="$PROMPT_COMMAND 2> >(colorize);"
#export $PROMPT_COMMAND
#exec 2> >(colorize)

#trap "exec 2> >(colorize)" DEBUG
#PROMPT_COMMAND='tput sgr0'

#path=""
#for i in ${PATH//:/ }; do
#       	path+=$(ls $i)" "
#done
#for i in $path; do
#       	alias $i='colorize $i'
#done
