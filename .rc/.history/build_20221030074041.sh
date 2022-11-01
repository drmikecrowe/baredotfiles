#!/usr/bin/env bash

rm -f target/*.sh
bashing uberbash
pushd target > /dev/null
sed 's/exit.*__STATUS/cli_bashrc' rc-* > $HOME/.bashrc-personal

popd > /dev/null
