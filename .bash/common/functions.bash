#!/usr/bin/env bash

mcd() { [ -n "$1" ] && mkdir -p "$@" && cd "$1"; }

new_script() {
    echo "#!$(which bash)" > "$1"
    echo " " >> "$1"
    chmod +x "$1"
    code "$1"
}
