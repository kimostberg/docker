#!/bin/bash

# Generate random API key
API_KEY=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w 32 | head -n 1)


# Create .env file and write API key
cat > .env <<EOF
PORT=59234
API_SECRET=${API_KEY}
GIN_MODE=release
EOF

# Print the generated API key
echo "Generated API Key: $API_KEY"

# Run the Docker container
#docker-compose up -d