#! /bin/bash

git clone https://github.com/ckulka/baikal-docker.git git
mkdir -p config Specific/db
sudo chown -R 101:101 config Specific
docker compose up -d