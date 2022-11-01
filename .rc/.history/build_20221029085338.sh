#!/usr/bin/env bash

rm -f target/*.sh
bashing uberbash
pushd target > /dev/null
sed -i '/exit.*__STATUS/d' target/rc-*
ln -s rc-* rc-latest.sh
popd > /dev/null
