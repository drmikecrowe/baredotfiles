# Save all history to ~/.logs
function detailed_hist() {
    if [ "$(id -u)" -ne 0 ]; then
        NOW=$(date "+%Y-%m-%d")
        DEST="${HOME}/.logs$(pwd)"
        if [ ! -d "$DEST" ]; then
            mkdir -p "$DEST"
        fi
        echo "$(date "+%Y-%m-%d.%H:%M:%S") $(history 1 | cut -b 8-)" >> "$DEST/bash-history-$NOW.log"
    fi
}

export PROMPT_COMMAND="$PROMPT_COMMAND;detailed_hist"
