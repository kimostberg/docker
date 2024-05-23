#!/bin/bash

wget -qO- https://raw.githubusercontent.com/kimostberg/docker/main/install_docker.sh | bash
sudo apt install jq curl -y

cd /docker
REPO="https://github.com/netbirdio/netbird/"
# this command will fetch the latest release e.g. v0.8.7
LATEST_TAG=$(basename $(curl -fs -o/dev/null -w %{redirect_url} ${REPO}releases/latest))
echo $LATEST_TAG

# this command will clone the latest tag
git clone --depth 1 --branch $LATEST_TAG $REPO
cd netbird/infrastructure_files/
cp setup.env.example setup.env
