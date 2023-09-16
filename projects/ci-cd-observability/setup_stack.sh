#!/bin/bash

echo "start Jenkins..."

cd ../../topics/helm/hands-on/deploy-jenkins/
ls -la
./deploy.sh

echo "Start ELK"
cd ../../topics/elk/helloworld/installation/docker-compose
ls -la
install.sh
