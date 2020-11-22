#!/usr/bin/env bash

if [ "$(which powerline-shell)" == "" ]; then
    echo "Please install powerline-shell (pip3 install powerline-shell)"
else
    function _update_ps1() {
        PS1=$(powerline-shell $?)
    }

    if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 && $(which powerline-shell) ]]; then
        PROMPT_COMMAND="_update_ps1$PROMPT_COMMAND"
    fi
fi
