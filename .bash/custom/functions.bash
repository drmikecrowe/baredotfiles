#!/usr/bin/env bash

mcd() {
    [ -n "$1" ] && mkdir -p "$@" && cd "$1";
}

rustscan() {
    /snap/bin/rustscan $@ -b 255 --ulimit 5000 2>/dev/null | sed -E '/Looks/,+5 d'
}
