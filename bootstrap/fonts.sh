#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}Fira Code${col_reset}"
sudo apt install -y fonts-firacode
fc-cache -fv