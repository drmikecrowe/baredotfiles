#!/usr/bin/env bash

SRC="/usr/local/etc/profile.d/autojump.sh"

if [ -f $SRC ]; then 
  source $SRC 
else
  echo "$SRC not found. Maybe install autojump?"
fi 
