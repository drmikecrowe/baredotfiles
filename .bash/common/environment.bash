#!/usr/bin/env bash

export ZOPTS="-I"

[[ ":$PATH:" != *":/$HOME/bin:"* ]] && export PATH="$PATH:/$HOME/bin"
[[ ":$PATH:" != *":/$HOME/.nodenv/bin:"* ]] && export PATH="$PATH:/$HOME/.nodenv/bin"
[[ ":$PATH:" != *":/$HOME/.pyenv/bin:"* ]] && export PATH="$PATH:/$HOME/.pyenv/bin"
[[ ":$PATH:" != *":/$HOME/.goenv/bin:"* ]] && export PATH="$PATH:/$HOME/.goenv/bin"
[[ ":$PATH:" != *":/$HOME/.local/bin:"* ]] && export PATH="$PATH:/$HOME/.local/bin"
[[ ":$PATH:" != *":/snap/bin:"* ]] && export PATH="$PATH:/snap/bin"
