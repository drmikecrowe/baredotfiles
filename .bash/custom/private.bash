#!/usr/bin/env bash

for f in $HOME/.private/*.sh; do
    source $f
done
