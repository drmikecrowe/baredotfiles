#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}docker${col_reset}"
sudo snap install docker
sudo addgroup --system docker
sudo usermod -aG docker $USER