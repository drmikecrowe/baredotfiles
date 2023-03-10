#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}goenv${col_reset}"
cd $HOME
wget -q https://github.com/drmikecrowe/goenv-installer/raw/master/bin/goenv-installer -O- | bash