#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Installing ${col_grn}xonsh${col_reset}"
pipx install xonsh
pipx inject xonsh xontrib-powerline2 packaging xontrib-autojump xonsh-docker-tabcomplete xontrib-ssh-agent xonsh-direnv xontrib-prompt-starship xontrib-readable-traceback xontrib-termcolors xonsh-autoxsh xontrib-langenv xontrib-langenv xontrib-log-all-history
out "Now, changing your default shell.  Will prompt for your password (^c to abort):"
chsh -s $(which xonsh)