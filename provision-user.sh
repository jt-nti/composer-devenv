#!/usr/bin/env bash

# Install NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] || curl --silent --show-error -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.3/install.sh | bash
. "$NVM_DIR/nvm.sh"

# Install node and npm
DEFAULT_NODE_VERSION=8.9.0
nvm which ${DEFAULT_NODE_VERSION} >/dev/null 2>&1 || nvm install ${DEFAULT_NODE_VERSION}

nvm use ${DEFAULT_NODE_VERSION}
nvm alias default ${DEFAULT_NODE_VERSION}

# Install generator-fabric-composer prereqs
npm ls -g yo >/dev/null 2>&1 || npm install -g yo
npm ls -g typings >/dev/null 2>&1 || npm install -g typings
npm ls -g bower >/dev/null 2>&1 || npm install -g bower
npm ls -g @angular/cli >/dev/null 2>&1 || npm install -g @angular/cli
