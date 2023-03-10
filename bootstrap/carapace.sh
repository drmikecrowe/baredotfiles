#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}carapace${col_reset}"
[[ -f /etc/apt/sources.list.d/fury.list ]] || echo 'deb [trusted=yes] https://apt.fury.io/rsteube/ /' | sudo tee /etc/apt/sources.list.d/fury.list
sudo apt-get update && sudo apt-get install carapace-bin