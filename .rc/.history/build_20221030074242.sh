#!/usr/bin/env bash

rm -f target/*.sh
bashing uberbash
pushd target > /dev/null
sed '/__run ".*/d' | sed 's/exit.*__STATUS/cli_bashrc/' rc-* > $HOME/.bashrc-personal.sh

popd > /dev/null
