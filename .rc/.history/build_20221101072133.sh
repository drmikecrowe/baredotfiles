#!/usr/bin/env bash

rm -f target/*.sh
bashing uberbash
pushd target > /dev/null
for system in bashrc zshomhz zshprezto; do
    sed '/__run ".*/d' rc-*  | sed '/^export __STATUS.*/d' | sed "s/exit.*__STATUS/cli_bashrc/"> $HOME/.bashrc-personal.sh
    sed '/__run ".*/d' rc-*  | sed '/^export __STATUS.*/d' | sed "s/exit.*__STATUS/cli_bashrc/"> $HOME/.zshrc-personal.sh
done
popd > /dev/null
