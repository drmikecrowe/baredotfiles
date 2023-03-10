#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}wavebox${col_reset}"
sudo wget -qO - https://wavebox.io/dl/client/repo/archive.key | sudo apt-key add -
echo "deb [arch=amd64] https://download.wavebox.app/stable/linux/deb/ amd64/" | sudo tee /etc/apt/sources.list.d/wavebox.list
sudo apt update
sudo apt install -y wavebox ttf-mscorefonts-installer