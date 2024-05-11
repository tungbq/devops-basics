#!/bin/bash

console_log() {
  echo ">>> [Microservices] $1"
}

# Variables
NAME_SPACE="demo-app"

# Deploy
console_log "Deploying the services"
console_log "NAME_SPACE: $NAME_SPACE"

if kubectl get namespace "$NAME_SPACE" &>/dev/null; then
  console_log "Namespace $NAME_SPACE already exists."
else
  console_log "Namespace $NAME_SPACE does not exist. Creating..."
  kubectl create namespace "$NAME_SPACE"
fi

kubectl apply -n $NAME_SPACE -f https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/main/release/kubernetes-manifests.yaml

# Wait for services up
kubectl get pods -n $NAME_SPACE
console_log "Waiting for all services are up. Sleeping 120s"
sleep 120

console_log "Checking pods"
kubectl get pods -n $NAME_SPACE
