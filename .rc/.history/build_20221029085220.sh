#!/usr/bin/env bash

rm -f target/*.sh
bashing uberbash
pushd target > /dev/null
ln -s rc-* rc-latest.sh
popd > /dev/null
sed -i '/exit.*__STATUS/d' target/rc-latest.sh
