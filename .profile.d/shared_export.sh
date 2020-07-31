appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
           export PATH="$1${PATH:+:$PATH}"
    esac
}

if [[ ! -f /tmp/profile.tmp ]]; then

	OLD_PATH=$PATH
	PATH=
	for path in `/bin/echo $OLD_PATH | /bin/sed 's/:/ /g'`; do
		appendpath "$path"
	done
fi

LIBRARY_PATH="${HOME}/.local/lib/:${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH="${LIBRARY_PATH%:}"
export EDITOR="nvim"
export MC="$HOME/.config/mutt"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

appendpath "${HOME}/.config/vim/plugged/vim-live-latex-preview/bin"
appendpath "${HOME}/.local/bin"
appendpath "${HOME}/.local/daemons"
appendpath "${HOME}/scripts"
echo "$0, $PATH" >> /tmp/profile.tmp
