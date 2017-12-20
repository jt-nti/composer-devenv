#!/usr/bin/env bash

if [ -z $1 ]; then
  COMPOSER_VERSION=latest
else
  COMPOSER_VERSION=$1
fi

if [ ${COMPOSER_VERSION} = 'latest' -o ${COMPOSER_VERSION:0:5} = '0.16.' ]; then
  export FABRIC_VERSION=hlfv1
elif [ ${COMPOSER_VERSION:0:5} = '0.17.' ]; then
  export FABRIC_VERSION=hlfv11
else
  >&2 echo "Unexpected COMPOSER_VERSION ${COMPOSER_VERSION}"
  >&2 echo "COMPOSER_VERSION must be a 0.16.x or 0.17.x version"
  >&2 echo "Alternatively leave COMPOSER_VERSION unset for the latest stable version"
  exit 1
fi

export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh"

npm install -g composer-cli@${COMPOSER_VERSION}

npm install -g composer-rest-server@${COMPOSER_VERSION}

npm install -g generator-hyperledger-composer@${COMPOSER_VERSION}

npm install -g composer-playground@${COMPOSER_VERSION}

mkdir ~/fabric-tools
cd ~/fabric-tools

curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.tar.gz
tar -xvzf fabric-dev-servers.tar.gz

./downloadFabric.sh
./startFabric.sh
./createPeerAdminCard.sh
