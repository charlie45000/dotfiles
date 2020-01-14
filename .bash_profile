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

#if [ -f "${HOME}/.gpg-agent-info" ]; then
#     source "${HOME}/.gpg-agent-info"
#       export GPG_AGENT_INFO
#       export SSH_AUTH_SOCK
#       export SSH_AGENT_PID
#else
#    eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
#fi
