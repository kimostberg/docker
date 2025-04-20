#!/bin/bash

# Set variables
BIN_NAME="capture"
VERSION="1.0.1"
ARCH="linux_amd64"
RELEASE_URL="https://github.com/bluewave-labs/capture/releases/download/v1.0.1/capture_${VERSION}_${ARCH}.tar.gz"
RELEASE_FILE="${BIN_NAME}_${VERSION}_${ARCH}.tar.gz"
SERVICE_NAME="capture"
GIN_MODE="release"

# Generate a random API secret key
API_SECRET=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w 32 | head -n 1)
echo "Generated API secret key: ${API_SECRET}"

# Download the binary
echo "Downloading ${RELEASE_FILE}..."
wget -O ${RELEASE_FILE} ${RELEASE_URL}

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download successful."
else
    echo "Download failed. Please check the URL or network connection."
    exit 1
fi

# Extract the binary
echo "Extracting ${RELEASE_FILE}..."
mkdir ${BIN_NAME}
tar -xvf ${RELEASE_FILE} -C ${BIN_NAME}

# Move the binary to /usr/local/bin
echo "Moving ${BIN_NAME} to /usr/local/bin..."
sudo mv ${BIN_NAME}/${BIN_NAME} /usr/local/bin/

# Create a systemd service file
echo "Creating systemd service file for ${SERVICE_NAME}..."
cat > /etc/systemd/system/${SERVICE_NAME}.service <<EOF
[Unit]
Description=${SERVICE_NAME}
After=network.target

[Service]
User=root
Environment="API_SECRET=${API_SECRET}"
Environment="GIN_MODE=${GIN_MODE}"
ExecStart=/usr/local/bin/${BIN_NAME}
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd daemon
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

# Start and enable the service
echo "Starting and enabling ${SERVICE_NAME} service..."
sudo systemctl start ${SERVICE_NAME}
sudo systemctl enable ${SERVICE_NAME}

# Clean up
echo "Removing ${RELEASE_FILE}..."
rm ${RELEASE_FILE}
rm -r ${BIN_NAME}

# Print the API secret key
echo "API secret key: ${API_SECRET}"
echo "Store this key securely to use with ${SERVICE_NAME}"