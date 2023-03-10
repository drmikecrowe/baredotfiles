#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}y_ppa_manager${col_reset}"
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo apt install -y y-ppa-manager