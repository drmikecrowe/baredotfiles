#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}kitty${col_reset}"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin