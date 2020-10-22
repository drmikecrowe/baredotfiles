#!/usr/bin/env bash

DIR=$HOME/.bash
case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)
    for f in $DIR/macos/*; do
        source $f
    done
    ;;
  linux*)
    for f in $DIR/linux/*; do
        source $f
    done
    ;;
  bsd*)     echo "BSD" ;;
  msys*)
    for f in $DIR/windows/*; do
        source $f
    done
    ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

for f in $DIR/common/*; do
  source $f
done

for f in $DIR/completions/*; do
  source $f
done
