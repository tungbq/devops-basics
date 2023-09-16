#!/bin/bash
CUR_DIR=$(pwd)
echo "start Jenkins..."

cd "$CUR_DIR/../../topics/helm/hands-on/deploy-jenkins/"
ls -la
./deploy.sh

echo "Start ELK"
cd "$CUR_DIR/../../topics/elk/helloworld/installation/docker-compose"
ls -la
./install.sh
