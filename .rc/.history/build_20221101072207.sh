#!/usr/bin/env bash

rm -f target/*.sh
bashing uberbash
pushd target > /dev/null
for system in bashrc zshomhz zshprezto; do
    sed '/__run ".*/d' rc-*  | sed '/^export __STATUS.*/d' | sed "s/exit.*__STATUS/cli_$system/"> $HOME/.$system-personal.sh
done
popd > /dev/null
