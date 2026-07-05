#!/bin/bash

console_log () {
  echo ">>> [Docker] $1"
}

console_log "Welcome to docker!"

console_log "Pull latest ubuntu docker image"
docker pull ubuntu:latest

console_log "Check docker images"
docker images | grep ubuntu

console_log "Run docker container and check OS release"
docker run --rm ubuntu:latest cat /etc/os-release

