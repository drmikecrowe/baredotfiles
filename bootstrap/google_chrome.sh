#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}google-chrome${col_reset}"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo rm -f /etc/apt/sources.list.d/google-chrome*
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-beta chrome-gnome-shell