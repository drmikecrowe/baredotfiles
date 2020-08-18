#!/usr/bin/env bash

DIR=$HOME/.bash 

if [ $(uname) = "Linux" ]; then
    source $DIR/linux-prompt.bash
    for f in $DIR/linux/*; do 
        source $f 
    done 
else
    for f in $DIR/windows/*; do 
        source $f 
    done 
fi

for f in $DIR/common/*; do 
  source $f 
done 

for f in $DIR/completions/*; do 
  source $f 
done 
