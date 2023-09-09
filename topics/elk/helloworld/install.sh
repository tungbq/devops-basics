#!/bin/bash

console_log() {
  echo ">>> [Elk] $1"
}


command -v kubectl

console_log "Configure Helm"
helm repo add elastic https://helm.elastic.co
helm repo update
helm search hub elasticsearch

console_log "Cleanup prev run"
./uninstall.sh

console_log "install elasticsearch"
helm install elasticsearch elastic/elasticsearch

console_log "waiting for service up and running..."
sleep 30

console_log "Port forwarding..."
kubectl port-forward svc/elasticsearch-master 9200:9200 &
console_log "Waiting 15s for port forward process completed..."
sleep 15
# login URL
elk_url="http://localhost:9200"
curl $elk_url
log $elk_url


console_log "install filebeat"
helm install filebeat elastic/filebeat

curl "$elk_url/_cat/indices"
