#! /bin/bash

#git clone https://github.com/ckulka/baikal-docker.git git
git -C git/ pull
#docker compose down --remove-orphans --rmi all
docker compose up -d