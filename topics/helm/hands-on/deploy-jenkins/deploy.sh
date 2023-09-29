#!/bin/bash

log() {
  local msg=$1
  echo "-------------------------"
  echo "> $msg"
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
secret=$(kubectl get secret -n jenkins jenkins -o jsonpath="$jsonpath" | xargs -0)
log $(echo $secret | base64 --decode)

# Portforward
## kill prev
log "Kill prev port"
### Run the pgrep command to search for the process running on the port 8090
PID=$(pgrep -f "port-forward 8090:8080")
if [[ "$PID" != "" ]]; then
  log "Killing $PID"
  kill -9 $PID
fi

log "Port forwarding..."
nohup kubectl port-forward service/jenkins 8090:8080 -n jenkins &
log "Waiting 15s for port forward process completed..."
sleep 15

# login URL
login_url="http://localhost:8090/login"
log $login_url

curl $login_url