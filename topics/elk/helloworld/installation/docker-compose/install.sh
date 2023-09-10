#!/bin/bash

# Get the current directory
CUR_DIR=$(pwd)

# Check if the script is executed from its own directory
if [[ $(basename "$0") != "install.sh" ]]; then
  echo "Not in the script's directory, exiting..."
  exit 1
fi

# Define workspace variables
WS_NAME="workspace/ws_elk"
WS_ABS_PATH="$CUR_DIR/$WS_NAME"

# Create the workspace directory if it doesn't exist
mkdir -p "$WS_ABS_PATH"

# Change to the workspace directory
cd "$WS_ABS_PATH" || exit

# Clone source code if it doesn't exist
if [ ! -d "docker-elk" ]; then
  git clone git@github.com:deviantony/docker-elk.git
fi

# Change to the docker-elk directory
cd "docker-elk" || exit

# Uninstall if needed
if [ -f "$CUR_DIR/uninstall.sh" ]; then
  echo "Uninstalling previous installation..."
  sh "$CUR_DIR/uninstall.sh"
fi

# Override local config env
if [ -f "$CUR_DIR/.custom-env" ]; then
  echo "Overwriting local config env..."
  cp "$CUR_DIR/.custom-env" .env
else
  echo "Warning: .custom-env file not found."
fi

# Deploy
echo "Deploying..."
docker-compose up -d

# Verify
echo "Verifying..."
if docker ps | grep -q "elk"; then
  echo "ELK stack is running."
else
  echo "ELK stack is not running."
fi
