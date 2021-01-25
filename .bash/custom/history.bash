#!/usr/bin/env bash

export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# rag: expand history but do not execute
shopt -s histverify
shopt -s cdspell
shopt -s nocaseglob
shopt -s histappend
shopt -s cmdhist
shopt -o vi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
