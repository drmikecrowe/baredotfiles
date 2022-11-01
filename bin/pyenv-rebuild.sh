#!/bin/bash

cd ~/.pyenv

for f in $(ls -1b versions/); do 
  reinstall-python $f
done
