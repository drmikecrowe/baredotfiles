#!/usr/bin/env bash

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# rag: expand history but do not execute
shopt -s histverify
shopt -s cdspell
shopt -s nocaseglob
shopt -s histappend
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# enter a few characters and press UpArrow/DownArrow
# to search backwards/forwards through the history
if [[ ${SHELLOPTS} =~ (vi|emacs) ]]
then
    bind '"[A":history-search-backward'
    bind '"[B":history-search-forward'
fi
