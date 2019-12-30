#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#show hex color in terminal
hextoterm() {
	for C in $@; do
		C=${C/\#/}
		#printf '\e]4;%d;%s\a\e[48;5;%dm %s ' "$#" "$C" "$#" "$C"	#without true color support, cause term colors to be permanently alterred
		#shift								#
		R=$((16#${C::2}))
		G=$((16#${C:2:2}))
		B=$((16#${C:4:2}))
		printf '\e[48;2;%d;%d;%d;30m #%s ' $R $G $B "$C"	
	done
	printf "\e[m\n"
	#tput oc
}

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias SS='sudo systemctl'
alias SP='sudo pacman'
alias urxvt='export LD_PRELOAD=;PROMPT_COMMAND="POMPT_COMMAND=;LD_PRELOAD=$HOME/.local/lib/libstderred.so";urxvt'

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

# tabbed surf
#alias tabbed-surf="tabbed -c surf -e"

#alias nordvpnr='nordvpn d; nordvpn c'


git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="[\u@\h \W]\$(git_branch)\$ "
#PS1='[\u@\h \W]\$ '

#source for auto completion:
source /etc/bash_completion.d/git-flow-completion.bash
source /usr/share/git/completion/git-completion.bash
source /usr/share/bash-completion/bash_completion

#stderr color
#export LD_PRELOAD="$HOME/.local/lib/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
