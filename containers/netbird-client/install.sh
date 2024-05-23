#!/bin/bash
mkdir -p /docker/netbird-client
cd /docker/netbird-client
wget https://raw.githubusercontent.com/kimostberg/docker/main/containers/netbird-client/compose.yml
rm .env
read -p "Enter client name: " CLIENT_NAME
read -p "Enter setup key: " SETUP_KEY
read -p "Enter management URL: " MANAGEMENT_URL

echo "CLIENT_NAME=$CLIENT_NAME" > .env
echo "SETUP_KEY=$SETUP_KEY" >> .env
echo "MANAGEMENT_URL=$MANAGEMENT_URL" >> .env

docker compose pull
docker compose up -d
docker compose logs -f