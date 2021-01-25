#!/usr/bin/env bash

export ZOPTS="-I"

[[ ":$PATH:" != *":/$HOME/bin:"* ]] && export PATH="/$HOME/bin:$PATH"
[[ ":$PATH:" != *":/$HOME/.local/bin:"* ]] && export PATH="/$HOME/.local/bin:$PATH"
[[ ":$PATH:" != *":/snap/bin:"* ]] && export PATH="/snap/bin:$PATH"

# This removes duplicates from the path
export PATH=$(echo $PATH | tr ':' '\n' | perl -lne 'chomp; print unless $k{$_}; $k{$_}++' | tr '\n' ':' | sed 's/:$//')
