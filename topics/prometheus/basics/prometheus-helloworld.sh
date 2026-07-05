#!/bin/bash

console_log() {
  echo ">>> [Prometheus] $1"
}

# If you wanna run the script and cleanup right after the demo, run this script with 'true' input
# e.g: prometheus-helloworld.sh true
CLEANUP_AFTER_DEMO=$1

local_port="9080"
prometheus_service_port="80"
port_fwd="$local_port:$prometheus_service_port"

PROMETHEUS_NAME="my-prometheus-stable"

console_log "Welcome to the Prometheus demo..."

console_log "Cleanup the previous Prometheus demo..."
./prometheus-helloworld-cleanup.sh "$port_fwd" "$PROMETHEUS_NAME"

console_log "Deploy our own Prometheus server"
console_log "Deploying Prometheus to Kubernetes - with Helm..."

console_log "Add the prometheus-community Helmcharts repo"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

console_log "List all the current repo"
helm repo list

console_log "Deploy Prometheus stable - default chart"
helm install $PROMETHEUS_NAME prometheus-community/prometheus

console_log "Waiting 20s for Helm deployment completed"
sleep 20

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
console_log "Your own Prometheus server URL is: http://localhost:$local_port"

console_log "Now visit your own Prometheus server URL"
console_log "[Search] Under the Search Expression, inpout 'container_cpu_load_average_10s'"
console_log "[Execute] Then hit the 'Execute' button on the right hand side"
console_log "[Result] You would see the result like:"
sample_result_output=$'container_cpu_usage_seconds_total{beta_kubernetes_io_arch="amd64", \n  beta_kubernetes_io_os="linux", cpu="total", id="/", instance="docker-desktop", \n  job="kubernetes-nodes-cadvisor", kubernetes_io_arch="amd64",\n  kubernetes_io_hostname="docker-desktop", kubernetes_io_os="linux"}\n  2334.7130145'
console_log "[Result] $sample_result_output"

console_log "Congrats! You did the first hands-on with Prometheus 🎉"

if [[ "$CLEANUP_AFTER_DEMO" == "true" ]]; then
  console_log "Do cleanup after the demo!"
  ./prometheus-helloworld-cleanup.sh "$port_fwd" "$PROMETHEUS_NAME"
  console_log "Cleanup completed!"
else
  console_log "Option cleanup after the demo is not set. You can cleanup the resource in this hands-on by running:"
  console_log "./prometheus-helloworld-cleanup.sh \"$port_fwd\" \"$PROMETHEUS_NAME\""
fi
