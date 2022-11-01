#!/usr/bin/env bash

rm -f target/*.sh
bashing uberbash
pushd target > /dev/null
sed '/__run ".*/d' rc-*  | sed 's/exit.*__STATUS/cli_bashrc/'> $HOME/.bashrc-personal.sh

popd > /dev/null
