#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}etckeeper${col_reset}"
sudo apt install -y etckeeper
sudo sed -i 's/^VCS=/#VCS/' /etc/etckeeper/etckeeper.conf
sudo sed -i 's/^#?VCS=.*git.*/VCS="git"/' /etc/etckeeper/etckeeper.conf
cd /etc
set +e
sudo etckeeper init
set -e
sudo etckeeper commit "Initial checkin"