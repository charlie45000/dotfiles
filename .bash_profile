#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#complete env
export PATH="${PATH}:~/bin"
export LD_LIBRARY_PATH="${HOME}/.local/lib/:${LD_LIBRARY_PATH}"
