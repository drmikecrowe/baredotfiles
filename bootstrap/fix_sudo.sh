#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}fix_sudo${col_reset}"
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/dont-prompt-$USER-for-sudo-password