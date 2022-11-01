# This code is from https://stackoverflow.com/a/7287873/45580 -- brilliant work

# note: printf is used instead of echo to avoid backslash
# processing and to properly handle values that begin with a '-'.

log() { printf '%s\n' "$*"; }
error() { log "ERROR: $*" >&2; }
fatal() { error "$@"; exit 1; }

# appends a command to a trap
#
# - 1st arg:  code to add
# - remaining args:  names of traps to modify
#
trap_add() {
    trap_add_cmd=$1; shift || fatal "${FUNCNAME} usage error"
    for trap_add_name in "$@"; do
        trap -- "$(
            # helper fn to get existing trap command from output
            # of trap -p
            extract_trap_cmd() { printf '%s\n' "$3"; }
            # print existing trap command with newline
            eval "extract_trap_cmd $(trap -p "${trap_add_name}")"
            # print the new trap command
            printf '%s\n' "${trap_add_cmd}"
        )" "${trap_add_name}" \
            || fatal "unable to add to trap ${trap_add_name}"
    done
}
# set the trace attribute for the above function.  this is
# required to modify DEBUG or RETURN traps because functions don't
# inherit them unless the trace attribute is set

# Save all history to ~/.logs
function detailed_hist() {
    [ "$(id -u)" -eq 0 ] && return
    NOW=$(date "+%Y-%m-%d")

    # Lifted from https://github.com/digitalist/bash_database_history/blob/master/bashrc_trap.sh
    [ -n "$COMP_LINE" ] && return  # do nothing if completing
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return # don't cause a preexec for $PROMPT_COMMAND

    # get CURRENT command
    local THIS_COMMAND=`history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g"`;
    [ "$THIS_COMMAND" = "$LAST_COMMAND" ] && return # Don't log the same command multiple times
    LAST_COMMAND="$THIS_COMMAND"

    # Duplicate current directory structure under ~.logs
    DEST="${LAH_FOLDER}$(pwd)"
    [ ! -d "$DEST" ] && mkdir -p "$DEST"

    # Save this
    echo "$(date "+%Y-%m-%d.%H:%M:%S") $THIS_COMMAND" >> "$DEST/bash-history-$NOW.log"
    # optional -- update history file and re-read it so all terminals share history
    history -a; history -c; history -r
}

declare -f -t trap_add

LAST_COMMAND=

if ! [[ $PROMPT_COMMAND =~ detailed_hist ]] ; then
    if [[ -z ${PROMPT_COMMAND} ]]; then
        PROMPT_COMMAND="detailed_hist"
    else
        PROMPT_COMMAND="detailed_hist;${PROMPT_COMMAND}"
    fi
fi

trap_add 'detailed_hist' DEBUG
