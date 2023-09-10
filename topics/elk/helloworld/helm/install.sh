#!/bin/bash
GREEN='\033[0;32m'
# ANSI escape code to reset text color to default
RESET='\033[0m'
console_log() {
  echo -e "${GREEN}>>> [Elk] $1${RESET}"
}

command -v kubectl

console_log "Configure Helm"
helm repo add elastic https://helm.elastic.co
helm repo update
helm search hub elasticsearch

console_log "Cleanup prev run!!!"
./uninstall.sh

console_log "install elasticsearch"
helm upgrade --install elasticsearch elastic/elasticsearch -f values.yml

console_log "waiting for service up and running..."
sleep 30

console_log "Port forwarding..."
kubectl port-forward svc/elasticsearch-master 9200 &
console_log "Waiting 15s for port forward process completed..."
sleep 15
# login URL
elk_url="http://localhost:9200"
curl $elk_url
console_log $elk_url


console_log "install metricbeat"
# helm upgrade --install filebeat elastic/filebeat
helm upgrade --install metricbeat elastic/metricbeat


console_log "install kibana"
helm upgrade --install kibana elastic/kibana
sleep 30

console_log "Port forwarding..."
kubectl port-forward svc/elasticsearch-master 5061:5061 &
console_log "Waiting 15s for port forward process completed..."
sleep 15
# login URL
kibana_url="http://localhost:5061"
curl $kibana_url
console_log $kibana_url
