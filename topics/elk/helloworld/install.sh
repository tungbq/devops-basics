#!/bin/bash

console_log() {
  echo ">>> [Elk] $1"
}


command -v kubectl

console_log "Configure Helm"
helm repo add elastic https://helm.elastic.co
helm repo update
helm search hub elasticsearch

console_log "install elasticsearch"
helm install elasticsearch elastic/elasticsearch