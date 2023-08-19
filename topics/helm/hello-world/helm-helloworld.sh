#!/bin/bash

console_log() {
  echo ">>> [Helm] $1"
}

CLEANUP=$1
HELM_SQL_NAME="my-nginx-demo"

command -v helm

console_log "Initialize a Helm Chart Repository"
helm repo add bitnami https://charts.bitnami.com/bitnami

console_log "Install Nginx Chart"
helm repo update
helm install $HELM_SQL_NAME bitnami/nginx

console_log "Check what has been released"
helm list

if [[ "$CLEANUP" == "true" ]]; then
  console_log "Uninstall MySQL Chart"
  helm uninstall $HELM_SQL_NAME
fi
