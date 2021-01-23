#!/usr/bin/env bash

mcd() { [ -n "$1" ] && mkdir -p "$@" && cd "$1"; }

