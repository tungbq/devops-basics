#!/bin/bash

console_log() {
  echo ">>> [Prometheus] $1"
}

local_port="9080"
prometheus_service_port="80"
port_fwd="$local_port:$prometheus_service_port"

PROMETHEUS_NAME="my-prometheus-stable"

console_log "Welcome to the Prometheus demo..."

console_log "Cleanup the previous Prometheus demo..."
./prometheus-helloworld-cleanup.sh "$port_fwd"

console_log "Deploy our own Prometheus server"
console_log "Deploying Prometheus to Kubernetes - with Helm..."

console_log "Add the prometheus-community Helmcharts repo"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

console_log "List all the current repo"
helm repo list

console_log "Deploy Prometheus stable - default chart"
helm install $PROMETHEUS_NAME prometheus-community/prometheus

console_log "Check the installation"
helm list

console_log "Check the K8s service"
kubectl get svc

kubectl port-forward "service/$PROMETHEUS_NAME-server" $port_fwd &
console_log "Waiting 10s for port forward process completed"
sleep 10

console_log "Check the prometheus web UI"
curl "localhost:$local_port"

console_log "Congrats! You've just deployed your own Prometheus using Helm 🎉🎉🎉"
console_log "Your own Prometheus URL is: http://localhost:$local_port"
