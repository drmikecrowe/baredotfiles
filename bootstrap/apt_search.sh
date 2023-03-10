#!/bin/bash

source $HOME/bootstrap/_setup.sh
out "Updating ${col_grn}apt${col_reset} to return single-line results"
echo 'Binary::apt::APT::Cache::Search::Version "1";' | sudo tee -a /etc/apt/apt.conf.d/99search