export CURRENT_SHELL=$(basename $(echo $0))

sourceFiles() {
    if [ -d $1 ]; then
        find $1 -maxdepth 1 -type f -print | egrep '\.sh$|\.bash$|.zsh$' | while read FILE; do
            source $FILE
        done
    fi
}

_command_exists() {
    command -v $1 >/dev/null
}

[[ ! -z $_RC_DEBUG ]] && echo "Setting CURRENT_SHELL=$CURRENT_SHELL"
