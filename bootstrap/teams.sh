#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}Microsoft Teams${col_reset}"
DEB=$(curl 'https://www.microsoft.com/en-us/microsoft-teams/download-app' \
    -H 'authority: www.microsoft.com' \
    -H 'pragma: no-cache' \
    -H 'cache-control: no-cache' \
    -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="99", "Opera";v="85"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "Linux"' \
    -H 'dnt: 1' \
    -H 'upgrade-insecure-requests: 1' \
    -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Edge/18.18362 Safari/537.36' \
    -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
    -H 'sec-fetch-site: none' \
    -H 'sec-fetch-mode: navigate' \
    -H 'sec-fetch-user: ?1' \
    -H 'sec-fetch-dest: document' \
    -H 'accept-language: en-US,en;q=0.9' \
    --compressed --silent | htmlq '.ow-platforms' | htmlq --attribute href a | head -n 1)
wget -O- $DEB > /tmp/teams.deb
sudo gdebi -n /tmp/teams.deb