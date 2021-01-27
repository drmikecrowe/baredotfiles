#!/usr/bin/env bash

# An array with the alias instances to enable
__enable_alias=(
)

# An array with the completion instances to enable
__enable_completion=(
  awscli
  bash-it
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
  log-all-history
  node
  nodenv
  pyenv
  ssh
  sshagent
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

# Enable all alias instances in one call
echo 'Enable alias instances:'
bash-it enable alias "${__enable_alias[@]}"
echo ''

# Enable all completion instances in one call
echo 'Enable completion instances:'
bash-it enable completion "${__enable_completion[@]}"
echo ''

# Enable all plugin instances in one call
echo 'Enable plugin instances:'
bash-it enable plugin "${__enable_plugin[@]}"
echo ''
