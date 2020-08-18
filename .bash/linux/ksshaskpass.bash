#!/usr/bin/env bash

if [ "$(which ksshaskpass)" != "" ]; then
    export SSH_ASKPASS="$(which ksshaskpath)"
fi