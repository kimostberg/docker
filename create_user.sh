#!/bin/bash

echo "Please enter a username:"
read username

if id -u "$username" >/dev/null 2>&1; then
  echo "User $username already exists, exiting..."
  exit 1
fi

adduser "$username"

if [ $? -eq 0 ]; then
  echo "Adding user $username to sudo and docker groups..."
  usermod -aG sudo "$username"
  usermod -aG docker "$username"
else
  echo "Failed to create user $username, exiting..."
  exit 1
fi

echo "User $username has been created and added to the sudo group."