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
kubectl get pods -n $NAME_SPACE

# Wait for services up
console_log "Waiting for all services are up. Sleeping 120s..."
# sleep 120

console_log "Checking all resouces in namespace '$NAME_SPACE'"
kubectl get all -n $NAME_SPACE

console_log "Checking pods"
kubectl get pods -n $NAME_SPACE

# Port forward
console_log "Forward the 'service/frontend' service"
## NOTE: You can change the '8080' port to whatever works on your machine
kubectl port-forward service/frontend -n $NAME_SPACE 8080:80

# Access the application
## Visit http://localhost:8080 to check your application

