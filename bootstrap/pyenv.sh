#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}pyenv${col_reset}"
cd ~
wget -O- https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash