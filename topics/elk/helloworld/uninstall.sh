#!/bin/bash

console_log() {
  echo ">>> [Elk] $1"
}

console_log "Uninstall"
helm delete elasticsearch
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
