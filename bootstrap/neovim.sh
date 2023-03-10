#!/bin/bash

source $HOME/bootstrap/_setup.sh
CONFIG=$HOME/.config/nvim
NVIM_PLUG=$HOME/.local/share/nvim/site
out "Installing ${col_grn}neovim${col_reset}"
github neovim/neovim