#!/bin/bash

CUR_DIR=$(pwd)
ls -la $CUR_DIR
if [[ $0 != "./install.sh" ]]; then
  echo "Not at the script path, exiting..."
  exit 1
fi

WS_NAME="workspace/ws_elk"
WS_ABS_PATH="$CUR_DIR/$WS_NAME"
mkdir -p $WS_ABS_PATH

cd $WS_ABS_PATH

# Clone src code
if [ ! -d "docker-elk" ]; then
  git clone git@github.com:deviantony/docker-elk.git
fi

cd docker-elk
ls -la

# Uninstall
sh "$CUR_DIR/uninstall.sh"

echo "Overwride local config env"
cp "$CUR_DIR/.custom-env" .env

# Deploy
echo "Deploying..."
docker-compose up setup
docker-compose up -d

# Verify
echo "Verifying..."
docker ps | grep elk
