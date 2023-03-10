#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}nodenv${col_reset}"
cd ~
wget -q https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-installer -O- | bash