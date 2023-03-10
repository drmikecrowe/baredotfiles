#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}bash_it${col_reset}"
cd "$HOME"

if [ -d ~/.bash_it ]; then
    git clone --depth 1 https://github.com/drmikecrowe/bash-it.git .bash_it