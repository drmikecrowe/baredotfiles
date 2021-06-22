#!/usr/bin/env bash

# An array with the alias instances to enable
__enable_alias=(
  personal
)

# An array with the completion instances to enable
__enable_completion=(
  awscli
  bash-it
  cod
  docker
  docker-compose
  export
  gcloud
  git
  git_flow_avh
  go
  lerna
  makefile
  npm
  pip3
  pnpm
  rvm
  ssh
  system
  tmux
  vuejs
  yarn
)

# An array with the plugin instances to enable
__enable_plugin=(
  autojump
  aws
  base
  basher
  direnv
  docker
  docker-compose
  dotbare
  extract
  git
  goenv
  history-search
  mcfly
  node
  nodenv
  personal
  private
  pyenv
  ssh
  sshagent
  starship
  tmux
)
# Find out where Bash-it is located, with a reasonable fallback
__BASH_IT_INSTALL=${BASH_IT:-$HOME/.bash_it}
if [ ! -f "$__BASH_IT_INSTALL/bash_it.sh" ] ; then
  echo "Bash-it not found at $__BASH_IT_INSTALL."
  # shellcheck disable=SC2016
  echo 'Please set the $BASH_IT variable to point to your Bash-it installation.'
  exit 1
else
  echo "Bash-it location  : $__BASH_IT_INSTALL"
fi
# shellcheck disable=SC1090
source "$__BASH_IT_INSTALL/bash_it.sh"
echo ''

# Disable all alias instances
echo 'Disable all alias instances:'
bash-it disable alias all

# Enable all alias instances in one call
echo 'Enable alias instances:'
bash-it enable alias "${__enable_alias[@]}"
echo ''

# Disable all completion instances
echo 'Disable all completion instances:'
bash-it disable completion all

# Enable all completion instances in one call
echo 'Enable completion instances:'
bash-it enable completion "${__enable_completion[@]}"
echo ''

# Disable all plugin instances
echo 'Disable all plugin instances:'
bash-it disable plugin all

# Enable all plugin instances in one call
echo 'Enable plugin instances:'
bash-it enable plugin "${__enable_plugin[@]}"
echo ''

if [ "$(uname)" != "Darwin" ]; then
  bash-it disable completion cod
  bash-it disable plugin bash-complete-partial-path
fi
