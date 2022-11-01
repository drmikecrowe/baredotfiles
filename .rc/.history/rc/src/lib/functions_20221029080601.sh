mkcd() {
    [ -n "$1" ] && mkdir -p "$@" && cd "$1";
}

rustscan() {
    /snap/bin/rustscan -g $@
}

rsyncFolder() {
    mkdir -p "$2"
    rsync -avrmR --exclude='node_modules/' --exclude='.tmp/' --exclude='.git/' --exclude='.webpack/' --exclude='.serverless/' --exclude='coverage/' --exclude='.history/' $@
}

sourceFiles() {
    if [ -d $1 ]; then
        find $1 -maxdepth 1 -type f -print | egrep '\.sh$|\.bash$|.zsh$' | while read FILE; do
            source $FILE
        done
    fi
}
