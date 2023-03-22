#!/bin/bash

WORK=(
    "aws-azure-login"
    "lerna"
)

COMMON=(
    "5to6-codemod"
    "@babel/preset-env"
    "@types/eslint-plugin-prettier"
    "@typescript-eslint/eslint-plugin"
    "@typescript-eslint/parser"
    "eslint"
    "eslint-config-prettier"
    "eslint-plugin-import"
    "eslint-plugin-jest"
    "eslint-plugin-jsx-a11y"
    "eslint-plugin-node"
    "eslint-plugin-promise"
    "eslint-plugin-react"
    "eslint-plugin-react-hooks"
    "generator-code"
    "install-peerdeps"
    "jest"
    "jscodeshift"
    "json2csv"
    "json-sort-cli"
    "maketypes"
    "mrm"
    "npm"
    "npm-check-updates"
    "prettier"
    "rona"
    "showdown"
    "sortjson"
    "syncpack"
    "ts-migrate"
    "ts-node"
    "typescript"
    "typesync"
    "yamljs"
    "yarn"
    "yarn-check"
    "yo"
    "zx"
)

HOME=(
    "@google/clasp"
    "@vue/cli"
    "@vue/cli-init"
    "depcheck"
    "firebase-tools"
    "mrm-task-typescript-eslint"
    "pnpm"
    "meta"
)

BIN="npm i -g"

case "$OSTYPE" in
  darwin*)
    $BIN ${COMMON[@]} ${WORK[@]}
    ;;
  linux*)
    $BIN ${COMMON[@]} ${HOME[@]}
    ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

nodenv rehash
