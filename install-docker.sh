#!/bin/sh

set -e # Exit script immediately on first error.
set -x # Print commands and their arguments as they are executed.

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg /tmp/docker-ce.key
sudo apt-key add /tmp/docker-gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
mkdir /home/vagrant/.docker
sudo cp /tmp/docker-config.json /home/vagrant/.docker/config.json