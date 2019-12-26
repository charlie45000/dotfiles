#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
