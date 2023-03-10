#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}dotbare${col_reset}"
git clone https://github.com/kazhala/dotbare.git ~/.dotbare
source ~/.dotbare/dotbare.plugin.bash
dotbare finit -u https://github.com/drmikecrowe/baredotfiles.git