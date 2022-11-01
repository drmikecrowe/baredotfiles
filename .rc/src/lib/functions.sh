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

[[ ! -z $_RC_DEBUG ]] && echo "Initialized functions.sh"
