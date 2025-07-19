#!/bin/bash

console_log() {
  echo ">>> [Kubernetes] $1"
}

local_port="9080"
service_port="8081"
port_fwd="$local_port:$service_port"

console_log "Cleanup previous run if any"
./k8s-helloworld-cleanup.sh $port_fwd

console_log "Welcome to Kubernetes!"

console_log "Deploying your first app on Kubernetes"
kubectl apply -f ./nginx-deployment.yaml

console_log "Check deployment rollout status"
kubectl rollout status deployment/nginx-deployment

console_log "Check deployemnt"
kubectl get deployments

console_log "Check pod"
kubectl get pods

console_log "Apply service"
kubectl apply -f ./nginx-service.yaml

console_log "Check services"
kubectl get services

kubectl port-forward service/nginx-service $port_fwd &
console_log "Waiting for port forward completed"
sleep 10

nginx_welcome_title="Welcome to nginx!"
curl "localhost:$local_port" | grep "$nginx_welcome_title"
