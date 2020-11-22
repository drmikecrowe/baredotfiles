#!/bin/bash

WORK=$(cat <<EOF
    aws-azure-login
    lerna
EOF
)

COMMON=$(cat <<EOF
    5to6-codemod
    @babel/preset-env
    @types/eslint-plugin-prettier
    @typescript-eslint/eslint-plugin
    @typescript-eslint/parser
    eslint
    eslint-config-prettier
    eslint-plugin-import
    eslint-plugin-jest
    eslint-plugin-jsx-a11y
    eslint-plugin-node
    eslint-plugin-promise
    eslint-plugin-react
    eslint-plugin-react-hooks
    generator-code
    install-peerdeps
    jest
    jscodeshift
    json-sort-cli
    mrm
    npm
    npm-check-updates
    prettier
    rona
    serverless
    showdown
    syncpack
    ts-migrate
    ts-node
    typescript
    typesync
    yamljs
    yarn
    yarn-check
    yo
EOF
)

HOME=$(cat <<EOF
    @google/clasp
    @vue/cli
    @vue/cli-init
    depcheck
    firebase-tools
    mrm-task-typescript-eslint
EOF
)


case "$OSTYPE" in
  darwin*)
    yarn add -g "${COMMON[@]} ${WORK[@]}"
    ;;
  linux*)
    pnpm i -g ${COMMON[@]} ${HOME[@]}
    ;;
  *)        echo "unknown: $OSTYPE" ;;
esac
