#!/usr/bin/env bash

mcd() {
    [ -n "$1" ] && mkdir -p "$@" && cd "$1";
}

rustscan() {
    /snap/bin/rustscan $@ -b 255 --ulimit 5000 2>/dev/null | sed -E '/Looks/,+5 d'
}

makeIndex() {
    if [ ! -z $1 ]; then
        pushd $1
    fi
    find . -maxdepth 1 -type f -name '*.ts' | egrep -v "index|spec" | sort | sed "s/\.ts$/'/" | sed "s/^/export * from '/" > index.ts
    find . -maxdepth 1 -type d | sort | while read DIR; do
        if [ "$DIR" == "." ]; then continue; fi
        if [ -f $DIR/index.ts ]; then
            echo "export * from '$DIR'" >> index.ts
        fi
    done
    if [ ! -z $1 ]; then
        popd
    fi
}

rsyncNode() {
    mkdir -p "$2"
    rsync -avrmR --exclude='node_modules/' --exclude='.tmp/' --exclude='.git/' --exclude='.webpack/' --exclude='.serverless/' $@
}
