#!/bin/bash

console_log() {
  echo ">>> [Prometheus] $1"
}

PROMETHEUS_NAME="my-prometheus-stable"

console_log "Welcome to the Prometheus demo..."

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

