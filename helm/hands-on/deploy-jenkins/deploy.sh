#!/bin/bash

log() {
  local msg=$1
  echo "-------------------------"
  echo "[ $msg ]"
  echo "-------------------------"
}

# Init and configure Helm
log "Adding Jenkins repo and get latest updates"
helm repo add jenkinsci https://charts.jenkins.io
helm repo update

# Create Persistent Volume
log "Create the volume"
kubectl apply -f jenkins-volume.yaml
log "Check the volume"
kubectl get pv

# Create a service account
kubectl apply -f jenkins-sa.yaml

# Update the values manually: Done. TODO: Automate this step

# Deploy
log "Start deploying..."
chart="jenkinsci/jenkins"
# helm install jenkins -n jenkins -f jenkins-values.yaml $chart
helm upgrade --install jenkins -n jenkins -f jenkins-values.yaml $chart

# Check deployment
log "Check deployment"
kubectl get pods -n jenkins

# Waiting for port up and running
pod_name_from_helm="jenkins-0"
while [[ $(kubectl get pods -n jenkins $pod_name_from_helm -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "waiting for pod - $pod_name_from_helm" && sleep 1; done

# Get metadata
log "Get 'admin' password"
jsonpath="{.data.jenkins-admin-password}"
secret=$(kubectl get secret -n jenkins jenkins -o jsonpath=$jsonpath)
log $(log $secret | base64 --decode)

# Portforward
## kill prev
log "kill prev port"
### Run the ps -ef command and use grep to filter the output for 'port-forward'
process_line=$(ps -ef | grep 'port-forward' | grep -v grep)
### Extract the PID from the process_line using awk or cut
PID=$(echo "$process_line" | awk '{print $2}')  # Using awk
log "Killing $PID"
kill -9 $PID

log "Port forwarding..."
nohup kubectl port-forward service/jenkins 8090:8080 -n jenkins &
log "Waiting 15s for port forward process completed..."
sleep 15
# login URL
login_url="http://localhost:8090/login"
curl $login_url
log $login_url
