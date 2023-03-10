#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}fix_max_user_watches${col_reset}"
cat <<EOF >/tmp/sysctl.aug
set /files/etc/sysctl.conf/fs.inotify.max_user_watches 524288
save
EOF
sudo augtool -f /tmp/sysctl.aug
sudo sysctl -p