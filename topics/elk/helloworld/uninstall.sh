#!/bin/bash
ORANGE='\033[0;33m'
# ANSI escape code to reset text color to default
RESET='\033[0m'
console_log() {
  echo -e "${ORANGE}>>> [CLEANUP] [Elk] $1${RESET}"
}

console_log "Delete related kibana"
kubectl delete configmap kibana-kibana-helm-scripts
kubectl delete serviceaccount pre-install-kibana-kibana
kubectl delete serviceaccount post-delete-kibana-kibana
kubectl delete roles pre-install-kibana-kibana
kubectl delete rolebindings pre-install-kibana-kibana
kubectl delete job pre-install-kibana-kibana

console_log "Uninstall"
helm delete elasticsearch
helm delete metricbeat
helm delete kibana

console_log "Elastic - Kill prev port"
### Run the ps -ef command and use grep to filter the output for 'port-forward'
process_line=$(ps -ef | grep 'port-forward' | grep "9200:9200" | grep -v grep)
### Extract the PID from the process_line using awk or cut
PID=$(echo "$process_line" | awk '{print $2}')  # Using awk
console_log "Killing $PID"
kill -9 $PID

console_log "Kibana - Kill prev port"
### Run the ps -ef command and use grep to filter the output for 'port-forward'
process_line=$(ps -ef | grep 'port-forward' | grep "5061:5061" | grep -v grep)
### Extract the PID from the process_line using awk or cut
PID=$(echo "$process_line" | awk '{print $2}')  # Using awk
console_log "Killing $PID"
kill -9 $PID
