#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}peek${col_reset}"
sudo add-apt-repository -y ppa:peek-developers/stable
sudo apt install -y peek