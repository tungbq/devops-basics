console_log() {
  echo ">>> [Kubernetes] $1"
}

kill_port() {
  port_fwd=$1
  ### Run the ps -ef command and use grep to filter the output for 'port-forward'
  process_line=$(ps -ef | grep 'port-forward' | grep "$1" | grep -v grep)
  ### Extract the PID from the process_line using awk or cut
  PID=$(echo "$process_line" | awk '{print $2}')  # Using awk
  console_log "Killing $PID"
  kill -9 $PID
}

console_log "Cleanup Kubernetes Demo!"
kill_port
kubectl delete -f hello-world/nginx-deployment.yaml
kubectl delete -f hello-world/nginx-service.yaml
