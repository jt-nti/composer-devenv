#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

# APT setup for docker packages
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 9DC858229FC7DD38854AE2D88D81803C0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
apt-cache policy docker-ce

# Update package lists
apt-get update

# Install jq (nice to have when there's JSON everywhere!)
apt-get -y --no-upgrade install jq

# Install unzip (useful for .card files)
apt-get -y --no-upgrade install unzip

# Install python 2 (required for node-gyp)
apt-get -y --no-upgrade install python-minimal

# Install Git
apt-get -y --no-upgrade install git

# Install nvm dependencies
apt-get -y --no-upgrade install build-essential libssl-dev

# Ensure that CA certificates are installed
apt-get -y --no-upgrade install apt-transport-https ca-certificates

# Install docker
apt-get -y --no-upgrade install docker-ce

# Add user to docker group
usermod -aG docker vagrant

# Install docker compose
if [ ! -x /usr/local/bin/docker-compose ]; then
  curl --silent --show-error -L "https://github.com/docker/compose/releases/download/1.13.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
fi
