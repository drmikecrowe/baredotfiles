#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}leapp${col_reset}"
RELEASE="$(wget -qnv -O- https://api.github.com/repos/Noovolari/leapp/releases/latest 2>/dev/null | jq -r '.tag_name')"
dl_url="https://asset.noovolari.com/latest/Leapp-${RELEASE:1}.AppImage"
dl_icon="$(wget -qO- https://www.leapp.cloud/releases | egrep -o 'https.*png' | head -n 1)"
out "AppImage=${col_grn}$dl_url${col_reset}"
out "png=${col_grn}$dl_icon${col_reset}"
BASENAME="Leapp"
curl --location --output /tmp/$BASENAME.AppImage "$dl_url"
curl --location --output /tmp/$BASENAME.png "$dl_icon"
install_appimage $BASENAME /tmp/$BASENAME.AppImage /tmp/$BASENAME.png
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "/tmp/session-manager-plugin.deb"
sudo gdebi -n /tmp/session-manager-plugin.deb