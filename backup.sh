#!/bin/bash

# Directory containing the Docker Compose files
dir="/docker"

# Path to the backup directory
backup_dir="/backup"

# Ensure the backup directory exists
mkdir -p "$backup_dir"

# Loop over each subdirectory in the specified directory
for d in "$dir"/*/ ; do
    # Check if the directory contains a Docker Compose file
    if [ -f "$d/compose.yml" ]; then
        # Navigate to the directory
        cd "$d"

        # Stop the containers
        docker compose down

        # Copy the directory content to the backup directory
        cp -R . "$backup_dir/$(basename "$d")" #-$(date +%Y%m%d%H%M%S)"

        # Start the containers
        docker compose up -d

        # Navigate back to the original directory
        cd - >/dev/null 2>&1
    fi
done
