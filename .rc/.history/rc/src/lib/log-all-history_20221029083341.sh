if [[ "$(id -u)" -ne 0 ]]; then

    if [[ -z $LAH_FOLDER ]]; then
        SHELL=$(basename $(echo $0))

        [[ ! -z $LAH_DEBUG ]] && echo "Initializing log-all-history for $SHELL"

        export LAH_FOLDER=${LAH_FOLDER:-${HOME}/.logs}

        [ -d $LAH_FOLDER ] || mkdir -p $LAH_FOLDER

        # my helper functions to search

        # Search logs from this folder and below only
        hdgrep() {
            WHERE="$LAH_FOLDER/$(pwd)"
            grep -Rh $@ $WHERE
        }

        # search all logs
        hgrep() {
            WHERE="$LAH_FOLDER"
            grep -Rh $@ $WHERE
        }
    fi
fi
