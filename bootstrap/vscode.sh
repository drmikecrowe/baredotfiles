#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}vscode${col_reset}"
URLBASE="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64";
DEB="${tmp_dir}/latest.deb";
out "Downloading latest version of ${col_grn}vscode${col_reset} is starting...";
wget --show-progress -O $DEB $URLBASE;
printf "Downloading finished.\n\n";

out "Closing ${col_grn}vscode${col_reset} ...";
for pid in $(pidof code); do kill -9 $pid; done
sudo gdebi $DEB