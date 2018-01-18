#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

# APT setup for docker packages
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list
apt-cache policy docker-engine

# Update package lists
apt-get update

# Install python 2 required for node-gyp
apt-get -y --no-upgrade install python-minimal

# Install Git
apt-get -y --no-upgrade install git

# Install nvm dependencies
apt-get -y --no-upgrade install build-essential libssl-dev

# Ensure that CA certificates are installed
apt-get -y --no-upgrade install apt-transport-https ca-certificates

# Install docker-engine
apt-get -y --no-upgrade install docker-engine

# Add user to docker group
usermod -aG docker vagrant

# Install docker compose
if [ ! -x /usr/local/bin/docker-compose ]; then
  curl --silent --show-error -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
fi
