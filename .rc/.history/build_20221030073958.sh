#!/usr/bin/env bash

rm -f target/*.sh
bashing uberbash
pushd target > /dev/null
sed -i 's/exit.*__STATUS/d' rc-*
ln -s rc-* rc-latest.sh
popd > /dev/null
