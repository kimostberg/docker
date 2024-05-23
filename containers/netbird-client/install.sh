#!/bin/bash
mkdir -p /docker/netbird-client
cd /docker/netbird-client
wget https://raw.githubusercontent.com/kimostberg/docker/main/containers/netbird-client/compose.yml

read -p "Enter client name: " CLIENT_NAME
read -p "Enter setup key: " NB_SETUP_KEY

echo "CLIENT_NAME=$CLIENT_NAME" >> ~/.env
echo "NB_SETUP_KEY=$NB_SETUP_KEY" >> ~/.env

docker compose pull
docker compose up -d
docker compose logs -f