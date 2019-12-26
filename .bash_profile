#
# ~/.bash_profile
#

# Append our default paths
appendload () {
    case ":$LD_PRELOAD:" in
        *:"$1":*)
            ;;
        *)
           export LD_PRELOAD="${LD_PRELOAD:+$LD_PRELOAD:}$1"
    esac
}

appendload "$HOME/.local/lib/libstderred.so"
unset appendload

[[ -f ~/.bashrc ]] && source ~/.bashrc

#complete env
[[ -z $WINDOWID ]] && setterm -blength 0 && \
       		      [[ -f ~/.profile.d/shared_export.sh ]] && source ~/.profile.d/shared_export.sh



