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

appendpath "${HOME}/.config/vim/plugged/vim-live-latex-preview/bin"
appendpath "${HOME}/bin"
echo "$0, $PATH" >> /tmp/profile.tmp
