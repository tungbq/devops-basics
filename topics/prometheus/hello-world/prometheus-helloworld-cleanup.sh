#!/bin/bash

console_log() {
  echo ">>> [Prometheus] $1"
}

kill_port() {
  local port_fwd=$1
  ### Run the pgrep command to find the process ID for 'port-forward'
  process_line=$(pgrep -f "port-forward.*$port_fwd")
  ### Extract the PID from the process_line using awk or cut
  PID="$process_line" # Using awk
  console_log "Killing $PID"
  kill -9 $PID
}

uninstall_chart() {
  local char_name=$1
  helm uninstall "$char_name"
}

console_log "Cleanup Prometheus Demo!"
kill_port "$1"
uninstall_chart "$2"
