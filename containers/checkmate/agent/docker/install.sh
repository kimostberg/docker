#!/bin/bash

# Generate random API key
API_KEY=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w 32 | head -n 1)

mkdir -p /docker/checkmate/agent
cd /docker/checkmate/agent
wget https://raw.githubusercontent.com/kimostberg/docker/refs/heads/main/containers/checkmate/agent/docker/compose.yml

# Create .env file and write API key
cat > .env <<EOF
PORT=59232
API_SECRET=${API_KEY}
GIN_MODE=release
EOF

# Print the generated API key
echo "Generated API Key: $API_KEY"

# Run the Docker container
docker-compose up -d