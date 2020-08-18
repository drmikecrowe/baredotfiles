#!/usr/bin/env bash

# Machine specific
if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    export DISPLAY=:0
fi
