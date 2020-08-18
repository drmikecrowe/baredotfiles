#!/usr/bin/env bash

[[ `which direnv` ]] && eval "$(direnv hook bash)"
[[ -d ~/.poetry ]] && source $HOME/.poetry/env