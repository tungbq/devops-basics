#!/bin/bash

console_log() {
  echo ">>> [Kubernetes] $1"
}

kill_port() {
  ### Run the pgrep command to search for the process running on the specified port
  PID=$(pgrep 'port-forward')

  # If the pgrep command does not find any processes, exit the function
  if [ -z "$PID" ]; then
    return
  fi

  console_log "Killing $PID"
  kill -9 "$PID"
}

console_log "Cleanup Kubernetes Demo!"

kill_port "$@"

kubectl delete -f "hello-world/nginx-deployment.yaml"
kubectl delete -f "hello-world/nginx-service.yaml"
