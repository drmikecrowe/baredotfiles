if [[ $CURRENT_SHELL == zsh ]] && [[ "$(id -u)" -ne 0 ]]; then

# This code is from https://www.reddit.com/r/zsh/comments/ervto1/logging_every_command_executed_not_the_usual/ -- brilliant work

_open_cmd_log() {
    local NOW=$(date "+%Y-%m-%d")
    local DEST_DIR="${LAH_FOLDER}$(pwd)"
    [[ -d $DEST_DIR ]] || mkdir -p $DEST_DIR
    local DEST="${DEST_DIR}/zsh-history-$NOW.log"
    if [[ $_LAH_LAST_FOLDER != $DEST ]]; then
        [[ ! -z $LAH_DEBUG ]] && echo "Closing _cmd_log_fd since folder changing"
        exec {_cmd_log_fd}<&-
        _LAH_STATE="closed"
    fi
    if [[ $_LAH_STATE == "closed" ]]; then
        [[ ! -z $LAH_DEBUG ]] && echo "Opening _cmd_log_fd to $DEST"
        sysopen -a -m 600 -o cloexec,creat -u _cmd_log_fd "$DEST" 2>/dev/null
        if (( $? )); then
            _cmd_log_fd=-1
            echo "Error in log-all-history plugin.  error $? opening $DEST"
        else
            _LAH_STATE="open"
            _LAH_LAST_FOLDER=$DEST
        fi
    fi
}

_detailed_hist() {
    _open_cmd_log
    if (( _cmd_log_fd >= 0 )); then
        print -r -- "${(%):-%D{%Y-%m-%d.%H:%M:%S\}} $3" >&$_cmd_log_fd
    fi
}

# First time initialization
if [[ -z $_LAH_STATE ]]; then
    [[ ! -z $LAH_DEBUG ]] && echo "Initializing log-all-history plugin"
    zmodload zsh/system
    typeset -gi _cmd_log_fd
    _LAH_STATE="closed"
    _LAH_LAST_FOLDER=""
fi

autoload -Uz add-zsh-hook
add-zsh-hook preexec _detailed_hist

fi
